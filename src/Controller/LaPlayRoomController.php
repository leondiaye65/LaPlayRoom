<?php

namespace App\Controller;

use App\Repository\ThemeRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * Class LaPlayRoomController
 * @package App\Controller
 * @Route("/", name="la_play_room_")
 */
class LaPlayRoomController extends AbstractController
{

    /**
     * @var $themeRepository
     */
    private $themeRepository;

    public function __construct(ThemeRepository $themeRepository)
   {
       $this->themeRepository = $themeRepository;
   }

    /**
     * @Route("/", name="accueil")
     */
    public function accueil(): Response

    {
        //Récupère la liste de tous les themes de la bdd

        $theme = $this->themeRepository->findAll();

        return $this->render(
            'la_play_room/accueil.html.twig',
            [
            'sectionPage' => $sectionPage = 'page accueil',
            'titrePage' => $titrePage = 'accueil',
            'themes' => $theme
        ]
        );
    }

    /**
     * @param string $slug
     * @return Response
     * @Route("/theme/{slug}", name="détails")
     */
    public function details(string $slug): Response
    {
        $theme = $this->themeRepository->findOneBy(['slug => $slug']);
        //dd($theme);
        return $this->render('la_play_room/theme.html.twig',
        [
            'sectionPage' => $sectionPage = 'page détails theme',
            'titrePage' => $titrePage = 'détails',
            'theme'=> $theme
        ]);
    }

}
