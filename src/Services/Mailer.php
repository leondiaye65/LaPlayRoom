<?php


namespace App\Services;


use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;
use Twig\Environment;

class Mailer
{
    private $mailer;
    public function __construct(MailerInterface $mailer, Environment $twig)
    {
        $this->mailer = $mailer;
        $this->twig = $twig;
    }
    public function sendEmail(string $from, string $to, string $subject, string $template, array $parameter)
    {
        $email = (new Email())
            ->from($from)
            ->to($to)
            ->subject($subject)

            // construit  la vue de l'email que recevra l'utilisateur.
            ->html(
                $this->twig->render($template, $parameter),
                'text/html'
            );

        $this->mailer->send($email);
    }
}
