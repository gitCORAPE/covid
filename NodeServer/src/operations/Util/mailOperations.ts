import ejs from "ejs";
import nodemailer from "nodemailer";
import path from "path";
import { createUpdateToken } from "../Auth/manageJWT";
export interface MailOptions {
    from: string;
    to: string;
    subject: string;
    html: string;
}

export interface StyledEmailContent {
    title: string;
    body: string;
    buttonTitle: string;
    link: string;
}

export interface MailResponse {
    accepted: string[];
    rejected: string[];
    envelopeTime: number;
    messageTime: number;
    messageSize: number;
    response: string;
    envelope:
    {
        from: string;
        to: string[];
    };
    messageId: string;
}

export const sendGenericMail = async (mail: MailOptions): Promise<any> => {
    const transporter = nodemailer.createTransport({
        service: process.env.SERVICE,
        auth: {
          user: process.env.USER,
          pass: process.env.PASSWORD
        }
    });
    const mailOptions = mail;

    const mailResponseMessage = await transporter.sendMail(mailOptions);
    return mailResponseMessage;
};

const generateStyledEmail  = async (data: StyledEmailContent): Promise<string> =>
    await ejs.renderFile(path.join(__dirname, "email_templates", "genericEmail.ejs"), data);

export const sendVerificationMail = async ( userId: string, userMail: string): Promise<any> => {
    // If needed here will be added the token generation
    const updateToken: string = createUpdateToken(userId, "0000");
    const activationLink: string = `${process.env.SERVERENDPOINT}/users/activate/${updateToken}`;
    const contentEmail = await generateStyledEmail({
        title: "Bienvenido",
        body: "Gracias por compartir con nosotros el deseo de preservar la memoria de nuestros pueblos. " +
               "Estás a solo un paso de ser un colaborador.",
        buttonTitle: "Activa tu cuenta",
        link: activationLink
    });

    const mailOptions: MailOptions = {
        from: process.env.USER,
        to: userMail,
        subject: "VERIFICA TU CUENTA",
        html: contentEmail
    };
    const response = await sendGenericMail(mailOptions);
    return response;
};

export const sendUpdateAccountMail = async (userId: string, imei: string, userMail: string): Promise<any> => {
    const updateToken: string = createUpdateToken(userId, imei);
    const updateLink: string = `${process.env.SERVERENDPOINT}/users/accountupdate/`;
    const mailOptions: MailOptions = {
        from: process.env.USER,
        to: userMail,
        subject: "ACTUALIZACIÓN DE CUENTA",
        html: "Hemos detectado que has ingresado en otro teléfono.\n" +
            "Si fuiste tu quien ingreso a otro teléfono, actualiza tu cuenta en el siguiente enlace: \n" +
            updateLink + updateToken + ""
    };
    const response = await sendGenericMail(mailOptions);
    return response;
};

