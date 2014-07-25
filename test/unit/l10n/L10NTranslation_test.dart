part of unit.test;

testL10NTranslation() {
    final Logger _logger = new Logger("unit.test.L10NTranslation");

    final Map<String,Map<String,String>> translationTable = {
        "en" : {
            "Hallo, dies ist ein {{what}}" : "Hello, this is a {{what}}"
        },

        "de" : {
            "Hallo, dies ist ein {{what}}" : "Hallo, dies ist ein {{what}}"
        }
    };

    group('L10NTranslation', () {
        setUp(() {
        });

        test('> Translation', () {
            final L10NTranslate translator = new L10NTranslate.withTranslation(
                {
                    "Hallo {{name}}" : "{{name}}, Welcome in ..."
                });

            expect(translator.translate(l10n("Hallo {{name}}",{ "name" : "Mike"})), "Mike, Welcome in ...");
        }); // end of 'Translation' test

        test('> Translate with call-function', () {
            final L10NTranslate translate = new L10NTranslate.withTranslation(
                {
                    "Hallo {{name}}" : "{{name}}, Welcome in ..."
                });

            expect(translate(l10n("Hallo {{name}}",{ "name" : "Mike"})), "Mike, Welcome in ...");

        }); // end of 'Translate with call-function' test

        test('> Translate (partial)', () {
            final L10N l10n = new L10N("Hallo {{l10n}}" , {
                "l10n" : TRANSLATOR(const L10N("Mike + {{name}}",const { "name" : "Sarah" })
                )
            });

            expect(l10n.message,"Hallo Mike + Sarah");
        }); // end of 'Translate' test

        test('> Translate with Table', () {
            final L10NTranslate translator = new L10NTranslate.withTranslation(
                {
                    "Hallo {{l10n}}" : "Willkommen {{l10n}}",
                    "Mike + {{name}}" : "in Australien {{name}}"
                });

            final L10N l10n = new L10N("Hallo {{l10n}}",{
                "l10n" : translator( const L10N("Mike + {{name}}",const { "name" : "Sarah" })
                )}
            );

            expect(translator( const L10N("Mike + {{name}}",const { "name" : "Sarah" })),"in Australien Sarah");
            expect(translator(l10n),"Willkommen in Australien Sarah");
        }); // end of 'Translate with Table' test

        skip_test('> Locale', () {
            final Intl intl = new Intl();
            _logger.info(intl.locale);
            _logger.info(Intl.shortLocale(intl.locale));

            String result;

            try {
                result = Intl.verifiedLocale('ysdex',(final String testLocale) {
                    _logger.info("VL: $testLocale");
                    return false;
                });
            } on ArgumentError catch (error) {
                result = "en";
            }


        }); // end of 'Locale' test

        test('> With external table', () {
            final L10NTranslate translate = new L10NTranslate.withTranslation(translationTable["en"]);

            expect(translate(l10n("Hallo, dies ist ein {{what}}",{ "what" : "Test"})),"Hello, this is a Test");
        }); // end of 'With external table' test

        test('> Switch locale', () {
            final L10NTranslate translate = new L10NTranslate.withTranslations(translationTable);

            // default locale is en
            expect(translate(l10n("Hallo, dies ist ein {{what}}",{ "what" : "Test"})),"Hello, this is a Test");

            translate.locale = "de";
            expect(translate(l10n("Hallo, dies ist ein {{what}}",{ "what" : "Test"})),"Hallo, dies ist ein Test");

            // does not exist
            translate.locale = "ru";

            // - Fallback to EN
            expect(translate(l10n("Hallo, dies ist ein {{what}}",{ "what" : "Test"})),"Hello, this is a Test");

            // Does not exist at all - brings back default message
            expect(translate(l10n("Hallo, {{name}}",{ "name" : "Mike"})),"Hallo, Mike");
        }); // end of 'Switch locale' test


    });
    // end 'L10NTranslation' group
}

//------------------------------------------------------------------------------------------------
// Helper
//------------------------------------------------------------------------------------------------
