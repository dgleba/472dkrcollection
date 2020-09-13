from generic_scaffold import CrudManager
from . import models

class PostCrudManager(CrudManager):
    model = models.Post
    prefix = 'posts'

