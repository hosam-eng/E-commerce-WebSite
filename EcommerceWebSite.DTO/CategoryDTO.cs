﻿using System.ComponentModel.DataAnnotations;

namespace EcommerceWebSite.DTO
{
	public class CategoryDTO
	{
		public int Id { get; set; }
		[StringLength(50, MinimumLength = 3, ErrorMessage = "Name Length Must Be Between 3 to 50 char")]
		public string Name { get; set; }
		public string Description { get; set; }

	}
}