/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

/**
 *
 * @author HenryRG
 */
import Dto.MensajeDTO;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.swing.JOptionPane;

/**
 *
 * @author Ismael
 */
public class Email {

    public final static String HOST_EMAIL_GMAIL = "smtpout.secureserver.net";

    private String host;
    private String puerto;
    private MensajeDTO mensaje;
    private Session session;
    private MimeMessage mimeMensaje ;

    public Email(String host, String puerto, MensajeDTO mensaje) throws MessagingException {
        this.host = host;
        this.puerto = puerto;
        this.mensaje = mensaje;
        inicializar();

    }

    private void inicializar() throws MessagingException {
        Properties propiedades = new Properties();
        propiedades.setProperty("mail.smtp.host", this.host);
        propiedades.setProperty("mail.smtp.starttls.enable", "true");
        propiedades.setProperty("mail.smtp.port", this.puerto);
        propiedades.setProperty("mail.smtp.user", this.mensaje.getEmailOrigen());
        propiedades.setProperty("mail.smtp.auth", "true");

        session = Session.getDefaultInstance(propiedades);

        mimeMensaje = new MimeMessage(session);
        mimeMensaje.setFrom(new InternetAddress(mensaje.getEmailOrigen()));
        mimeMensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(mensaje.getEmailDestino()));
    }

    public String enviarEmail(String asunto, String mensaje) throws MessagingException {
        mimeMensaje.setSubject(asunto);
        mimeMensaje.setContent(mensaje, "text/html");

        Transport transport = session.getTransport("smtp");
        transport.connect(this.mensaje.getEmailOrigen(), this.mensaje.getEmailpass());
        transport.sendMessage(mimeMensaje, mimeMensaje.getAllRecipients());
        transport.close();
        return "al correo " + this.mensaje.getEmailDestino();
    }

}

