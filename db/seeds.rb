# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(username: 'kurovale', password: '123')

Wiki.create(title_en: 'Artificial intelligence',
            body_en: "Artificial intelligence (AI) is intelligence demonstrated by machines, as opposed to the natural intelligence displayed by animals including humans. AI research has been defined as the field of study of intelligent agents, which refers to any system that perceives its environment and takes actions that maximize its chance of achieving its goals.\n\n The term \"artificial intelligence\" had previously been used to describe machines that mimic and display \"human\" cognitive skills that are associated with the human mind, such as \"learning\" and \"problem-solving\". This definition has since been rejected by major AI researchers who now describe AI in terms of rationality and acting rationally, which does not limit how intelligence can be articulated.",
            category: 'technology',
            user: user)

Wiki.create(title_en: 'Cairo',
            body_en: "Cairo is the capital of Egypt and the largest city in the Arab world. The Greater Cairo metropolitan area, with a population of 21.3 million, is the largest urban agglomeration in Africa, the largest in the Arab world and the Middle East, and the sixth-largest in the world by population. Cairo is associated with ancient Egypt, as the Giza pyramid complex and the ancient cities of Memphis and Heliopolis are located in its geographical area. Located near the Nile Delta, the city first developed as Fustat, a settlement founded after the Muslim conquest of Egypt in 640 next to an existing ancient Roman fortress, Babylon. Under the Fatimid dynasty a new city, al-Qāhirah, was founded nearby in 969. It later superseded Fustat as the main urban centre during the Ayyubid and Mamluk periods (12th-16th centuries). Cairo has long been a centre of the region\'s political and cultural life, and is titled \"the city of a thousand minarets\" for its preponderance of Islamic architecture. Cairo\'s historic center was awarded World Heritage Site-status in 1979. Cairo is considered a World City with a \"Beta +\" classification according to GaWC.",
            category: 'world',
            user: user)

Wiki.create(title_en: 'Aesthetics',
            body_en: "Aesthetics, or esthetics, is a branch of philosophy that deals with the nature of beauty and taste, as well as the philosophy of art (its own area of philosophy that comes out of aesthetics). It examines aesthetic values, often expressed through judgments of taste.\n\n Aesthetics covers both natural and artificial sources of experiences and how we form a judgment about those sources. It considers what happens in our minds when we engage with objects or environments such as viewing visual art, listening to music, reading poetry, experiencing a play, watching a fashion show, movie, sports or even exploring various aspects of nature. The philosophy of art specifically studies how artists imagine, create, and perform works of art, as well as how people use, enjoy, and criticize art. Aesthetics considers why people like some works of art and not others, as well as how art can affect moods or even our beliefs. Both aesthetics and the philosophy of art ask questions like \"What is art?,\" \"What is a work of art?,\" and \"What makes good art?\"\n\n Scholars in the field have defined aesthetics as \"critical reflection on art, culture and nature\". In modern English, the term \"aesthetic\" can also refer to a set of principles underlying the works of a particular art movement or theory (one speaks, for example, of a Renaissance aesthetic).",
            category: 'philosophy',
            user: user)
