<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('nom', TextType::class,
                [
                    'required' => true,
                    'attr' => array(
                        'placeholder' => 'Entrez un nom')
                ])
            ->add('email', EmailType::class,
                [
                    'required' => true
                ])

            ->add('objet', TextType::class,
                [
                    'required' => false
                ])
            ->add('message', TextareaType::class,
                [
                    'required' => true
                ])
            ->add('submit', SubmitType::class, [
                'label' => "Envoyer message",
                'attr' => [
                    'class' => 'text-white btn btn -dark bg-secondary m-3']
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            // Configure your form options here
        ]);
    }
}
