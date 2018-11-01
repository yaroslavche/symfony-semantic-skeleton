<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use FOS\UserBundle\Model\UserManagerInterface;

class UserFixtures extends Fixture
{
    /**
     * @var UserManagerInterface $userManager
     */
    private $userManager;

    /**
     * UserFixtures constructor.
     * @param UserManagerInterface $userManager
     */
    public function __construct(UserManagerInterface $userManager)
    {
        $this->userManager = $userManager;
    }

    public function load(ObjectManager $manager)
    {
        $user = $this->userManager->createUser();
        $user->setUsername('admin');
        $user->setEmail('admin@test.dev');
        $user->setPlainPassword('123');
        $user->setEnabled(true);
        $user->setRoles(array('ROLE_SUPER_ADMIN'));
        $this->userManager->updateUser($user, true);
    }
}
