from django.db import models
from django.contrib.auth.models import (BaseUserManager, AbstractUser, Group, Permission, GroupManager)
from myassets.models import AssetGroup, Asset


class MyUserManager(BaseUserManager):
    def create_user(self, username, email, date_of_birth, password=None, role=None):
        """
        Creates and saves a User with the given email, date of
        birth and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(username=username,email=self.normalize_email(email),date_of_birth=date_of_birth,)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, email, date_of_birth, password):
        user = self.create_user(username=username, email=email, password=password, date_of_birth=date_of_birth)
        user.is_admin = True
        user.is_superuser = True
        user.role = 'SU'
        user.save(using=self._db)
        return user


class MyUser(AbstractUser):
    USER_ROLE_CHOICES = (
        # ('SU', '超级管理员'),
        ('AU', '管理员'),
        ('CU', '普通用户'),
    )

    username = models.CharField(verbose_name='user name', max_length=20, unique=True)
    email = models.EmailField(verbose_name='email address',max_length=255,unique=True)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    role = models.CharField(max_length=2, choices=USER_ROLE_CHOICES, default='CU')
    date_of_birth = models.DateField()
    asset = models.ManyToManyField(Asset)
    assetgroup = models.ManyToManyField(AssetGroup)

    objects = MyUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'date_of_birth']

    def get_full_name(self):
        # The user is identified by their email address
        return self.email

    def get_short_name(self):
        # The user is identified by their email address
        return self.email

    def __str__(self):
        return self.email

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        # Simplest possible answer: All admins are staff
        return self.is_admin

    class Meta:
        permissions = (
            ("can_viewuser", "Can view users"),
            ("can_viewgroup", "Can view groups"),
            ("change_password", "Can change_password"),
            ("reset_password", "Can reset_password"),
        )



