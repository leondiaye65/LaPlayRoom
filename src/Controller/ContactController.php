<?php

namespace App\Controller;

use App\Form\ContactType;
use App\Services\Mailer;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;



class ContactController extends AbstractController
{
    /**
     * @Route("/contact", name="contact")
     */
   public function index(Request $request, Mailer $mailer): Response
    {
        $formContact = $this->createForm(ContactType::class, null);
        $formContact->handleRequest($request);

        if ($formContact->isSubmitted() && $formContact->isValid()) {

            $data = $formContact->getData();

           $mailer->sendEmail(

                $data['email'],
                "laplayroom2021@gmail.com",
                "LaPlayRoom.fr - Renseignements",
                "email/contact.html.twig",
                [
                    "data" => $data,
                ]);
            $this->addFlash('success','Message envoyer avec succès');

        }


        return $this->render('contact/contact.html.twig', [
            'form' => $formContact->createView(),
            'titre_page' => $titrePage = "Contact",
            'titre_section' => $titreSection = "page de contact",

        ]);
    }
}
