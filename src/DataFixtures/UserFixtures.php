<?php

namespace App\DataFixtures;

use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;

use App\Entity\User;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\Validator\Constraints\DateTime;

class UserFixtures extends Fixture
{
    private $passwordEncoder;



    public function __construct(UserPasswordEncoderInterface $passwordEncoder)

    {

        $this->passwordEncoder = $passwordEncoder;
    }

    public function load(ObjectManager $manager)

    {

        $user = new User();

        $user->setPassword($this->passwordEncoder->encodePassword(

            $user,

            '123123'

        ));

        $user->setEmail("user2@gmail.com");
        $user->setBDathe(new \DateTime("1990-04-07"));
        $user->setPhone("000033555");


        $manager->persist($user);

        $manager->flush();
    }
}
