using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Helpers
{
    //Classe utilisé par le Account/Edit afin de changer les rôles d'un utilisateur
    public class RolesHelper
    {
        public RolesHelper()
        {

        }

        public void ChangeRoles(ApplicationUser user, IEnumerable<string> roles, ApplicationUserManager userManager)
        {
            userManager.AddToRoles(user.Id, CompareToFindAdditions(user.roles, roles).ToArray());
            userManager.RemoveFromRoles(user.Id, CompareToFindWithdrawals(user.roles, roles).ToArray());
        }

        private IEnumerable<string> CompareToFindAdditions(IEnumerable<string> oldCollection, IEnumerable<string> newCollection)
        {
            List<string> additions = new List<string>();
            foreach (string newRole in newCollection)
            {
                bool exist = false;
                foreach(string oldRole in oldCollection)
                {
                    if (newRole == oldRole)
                        exist = true;
                }
                if (!exist)
                    additions.Add(newRole);
            }
            return additions;
        }

        private IEnumerable<string> CompareToFindWithdrawals(IEnumerable<string> oldCollection, IEnumerable<string> newCollection)
        {
            List<string> withdrawals = new List<string>();
            foreach (string oldRole in oldCollection)
            {
                bool exist = false;
                foreach (string newRole in newCollection)
                {
                    if (oldRole == newRole)
                        exist = true;
                }
                if (!exist)
                    withdrawals.Add(oldRole);
            }
            return withdrawals;
        }
    }
}