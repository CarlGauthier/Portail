using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Helpers
{
    public class MailHelper
    {
        public MailHelper()
        {

        }

        public void SendActivationMail(RegisterViewModel user)
        {
            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.Host = "mail.dicj.info";
            client.Timeout = 10000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new System.Net.NetworkCredential("equipe1@dicj.info", "equipe1");
            string subject = "Bienvenue sur Portail!";
            string body = BuildActivationMail(user);
            MailMessage message = new MailMessage("portaildonotreply@dicj.info", "gauthiercarl1@gmail.com", subject, body);
            message.IsBodyHtml = true;
            client.Send(message);
        }

        private string BuildActivationMail(RegisterViewModel user)
        {
            return "<p> Bonjour " + user.prenom + ",</p>" +
                "<p>Un compte à été crée pour vous, rendez vous sur Portail afin de vous connectez avec les informations suivantes:</p>" +
                "<p><b> Courriel: </b>" + user.Email + "<br>" +
                "<b> Mot de passe: </b>" + user.password + "</p>" +
                "<p>Vous devrez changer votre mot de passe afin d'activer le compte.</p>" +
                "<p>Cordialement,</p>" +
                "<p>L'équipe de Portail</p>";
        }
    }
}