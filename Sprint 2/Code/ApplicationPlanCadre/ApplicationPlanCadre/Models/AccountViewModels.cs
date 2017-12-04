using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ApplicationPlanCadre.Models
{
    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Courriel")]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Mot de passe")]
        public string Password { get; set; }

        [Display(Name = "Mémoriser le mot de passe ?")]
        public bool RememberMe { get; set; }
    }

    public class RegisterViewModel
    {
        [Required]
        [StringLength(50)]
        [Display(Name = "Nom")]
        public string Nom { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Prénom")]
        public string Prenom { get; set; }
		
        [Required]
        [EmailAddress]
        [Display(Name = "Courriel")]
        public string Email { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "La chaîne {0} doit comporter au moins {2} caractères.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Mot de passe")]
        public string Password { get; set; }
    }
}
