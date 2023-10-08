from django.db import models

# Create your models here.

class Titanic(models.Model):
    name = models.CharField('name', max_length=50)
    sex = models.IntegerField('sex')
    age = models.FloatField('age')
    sibsp = models.IntegerField('sibsp')
    parch = models.IntegerField('parch')
    pclass = models.IntegerField('pclass')
    fare = models.FloatField('fare')
    survived = models.FloatField('survived')

    def __str__(self) -> str:
        return f"{self.name}, {self.age}, survived with {self.survived} probability"