using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace EcommerceWebSiteMVC.Controllers
{
	[Authorize]
	public class OrderItemController : Controller
	{
		public IActionResult Index()
		{
			return View();
		}

	}
}
