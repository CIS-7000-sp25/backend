class Command(BaseCommand):
    help = """Easily refactor database. Usage: 'python manage.py refactor {sublayer, commit}"""

    def add_arguments(self, parser):
        parser.add_argument('method', 
                            type=str, 
                            choices=['sublayer', 
                                     'commit']
                                     )

    def handle(self, *args, **options):
        print(options)
        match options['method']:
            case "sublayer":
                self.expandSublayer()
            case "commit":
                self.expandCommit()

    def expandCommit(self):
        pass

    def expandSublayer(self):
        pass

    suppressed_base_arguments = ["--version", "--verbosity", "--settings", "--pythonpath", "--traceback", "--no-color", "--force-color", "--skip-checks"]


