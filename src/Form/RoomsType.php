<?php

namespace App\Form;

use App\Entity\Status;
use App\Entity\Rooms;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

use Symfony\Component\Validator\Constraints\File;

use Symfony\Component\Form\Extension\Core\Type\FileType;


class RoomsType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('bed_number')
            ->add('description')
            ->add('price')
            ->add('fk_status', EntityType::class, [

                'class' => Status::class,

                'choice_label' => 'name',

            ])
            ->add('picture', FileType::class, [
                'label' => 'Upload Picture',
                //unmapped means that is not associated to any entity property
                'mapped' => false,
                //not mandatory to have a file
                'required' => false,

                //in the associated entity, so you can use the PHP constraint classes as validators
                'constraints' => [
                    new File([
                        'maxSize' => '1024k',
                        'mimeTypes' => [
                            'image/png',
                            'image/jpeg',
                            'image/jpg',
                        ],
                        'mimeTypesMessage' => 'Please upload a valid image file',
                    ])
                ],
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Rooms::class,
        ]);
    }
}
