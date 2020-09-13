from crudbuilder.abstract import BaseCrudBuilder
from peep.models import Person

class PersonCrud(BaseCrudBuilder):
        model = Person
        search_fields = ['name', 'email']
        tables2_fields = ('name', 'email')
        tables2_css_class = "table table-bordered table-condensed"
        tables2_pagination = 5  # default is 10
        modelform_excludes = ['created_by', 'updated_by']
        # login_required=True
        # permission_required=True
        # permissions = {
        #   'list': 'example.person_list',
        #       'create': 'example.person_create'
        # }