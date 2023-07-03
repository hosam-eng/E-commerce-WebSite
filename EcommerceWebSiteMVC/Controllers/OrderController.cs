using EcommerceWebSite.Application.Services;
using EcommerceWebSite.Domain;
using EcommerceWebSite.DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Security.Claims;
using System.Security.Policy;

namespace EcommerceWebSiteMVC.Controllers
{
    [Authorize]
	public class OrderController : Controller
	{
		private readonly IOrderService orderService;
		private readonly IOrderItemService orderItemService;
		private readonly IProductService productService;
		//List<userCartDTO> cartItems;
		//Claim userID;
		public OrderController(IOrderService _orderService,IOrderItemService _orderItemService, IProductService _productService)
        {
			orderService = _orderService;
			orderItemService = _orderItemService;
			productService = _productService;
			//userID = User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.Name);
			//cartItems = new List<userCartDTO>();
		}
        public IActionResult Index()
		{
			return View();
		}
		async Task<bool> CheckUserCart()
		{
			List<userCartDTO> cartItems = new List<userCartDTO>();
			var userID = User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.Name);
			string cookieValue;

			if (Request.Cookies.TryGetValue(userID.Value, out cookieValue))
			{
				cartItems = JsonConvert.DeserializeObject<List<userCartDTO>>(cookieValue);
			}
			foreach(var item in cartItems)
			{
				int quantity = await productService.GetQuantity(item.Id);
				if (quantity < item.Quantity)
				{
					return false;
				}
			}
			return true;
		}
        public async Task<IActionResult> CreateOrder(decimal totalPrice)
        {
            List<userCartDTO> cartItems = new List<userCartDTO>();
            var userID = User.Claims.FirstOrDefault(p => p.Type == ClaimTypes.Name);
            var UID = User.Claims.FirstOrDefault(u => u.Type == ClaimTypes.NameIdentifier);
            var orderDto = new OrderDTO()
            {
                OrderDate = DateTime.Now,
                ArrivalDate = DateTime.Now.AddDays(3),
                Address = "sohag",  //User.Identity.Address
                TotalPrice = totalPrice,
                UserId = UID.Value //"3265a9de-b2fb-4dd9-a491-2eb47da5cf88"   //User.Identity.Name //User.Identity.
            };
            if (await CheckUserCart())
            {
                var orderResDto = await orderService.CreateOrderAsync(orderDto);
                string cookieValue;



                if (Request.Cookies.TryGetValue(userID.Value, out cookieValue))
                {
                    cartItems = JsonConvert.DeserializeObject<List<userCartDTO>>(cookieValue);
                }
                foreach (var itemOrder in cartItems)
                {
                    int quantity = await productService.GetQuantity(itemOrder.Id);
                    if (itemOrder.Quantity < quantity)
                    {
                        var itemDto = new OrderItemDto()
                        { OrderId = orderResDto.Id, Count = itemOrder.Quantity, ProductId = itemOrder.Id };
                        bool res = await orderItemService.CreateOrderItem(itemDto);
                        bool updated = await productService.updateQuantity(itemOrder.Id, itemOrder.Quantity);
                    }
                    else
                    {
						return Json(quantity);
					}
                }
                Response.Cookies.Delete(userID.Value);
            }
            return Json(null);
        }
    }
}
