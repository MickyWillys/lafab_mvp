namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    populateUser
    populateSkills if Skill.count < 50
    
  end
end 

namespace :db do
  desc "Fill rdatabase with sample data"
  task tag: :environment do

    tags = ["computer", "sport", "DIY", "science", "hobby", "leisure", "job"]
    @skills = Skill.all
    @skills.each do |s|
      r = rand(1..3)
      r.times do
        t= rand(1..7)
        s.tag_list.add(tags[t])
      end
      s.save
    end
      
  end
end 

namespace :db do
  desc "Fill rdatabase with sample data"
  task loca: :environment do

    randomlocation
      
  end
end 

def populateUser
  15.times do |n|
    myname = Faker::Name.first_name + " " + Faker::Name.last_name
    
    user_db = User.create!(name: myname)

    acc_user = Account.create(email:"example#{user_db.id}@lafab.net", 
                              password:"example#{user_db.id}", 
                              password_confirmation:"example#{user_db.id}", 
                              user_id: user_db.id)


    # r= rand(10)

    # r.times do
    #   user_id= user_db.id 
    #   tit = Faker::Lorem.words(3) * " "
    #   des = Faker::Lorem.sentences(3) * " "
    #   todo_user = Todo.create!(user_id: user_id ,title: tit,
    #                       description: des)
    # end
  end
end 

def populateSkills
  v = ["Copy", "Cut","Erase", "Play", "Do"]
  w =["guitare","computer", "bike","table","saw", "chair", "screen", "ball"]
  @users = User.all
  @users.each do |user|

    r= rand(10)

    r.times do
      tit = v[rand(0..4)] + " the " + w[rand(0..7)]
      des = Faker::Lorem.sentences(3) * " "
      todo_user = Skill.create!(user_id: user.id ,title: tit,
                          description: des)
    end
  end
end

  def randomlocation

  streets =["Allée Arthur Honegger ","Allée Anne de Beaujeu ", "Allée Darius Milhaud ", "Allée Diane de Poitiers ", 
    "Allée Gabrielle d'Estrées ", "Allée Garance ", "Allée Georges Récipon ", "Allée Louise Labé ", "Allée Pernette du Guillet ", 
    "Allée Pierre Mollaret ", "Allée de Fontainebleau ", "Allée des Cardinoux ", "Allée des Eiders ", "Allée des Orgues de Flandre ", 
    "Allée du Brindeau ", "Avenue Ambroise Rendu ", "Avenue Corentin Cariou ", "Avenue Debidour ", "Avenue Jean Jaurès ", "Avenue Mathurin Moreau ", 
    "Avenue Moderne ", "Avenue René Fonck ", "Avenue Secrétan ", "Avenue Simón Bolívar ", "Avenue de Flandre ", "Avenue de Laumière ", 
    "Avenue de la Porte Brunet ", "Avenue de la Porte Chaumont ", "Avenue de la Porte d'Aubervilliers ", "Avenue de la Porte de la Villette ", 
    "Avenue de la Porte de Pantin ", "Avenue de la Porte des Lilas ", "Avenue de la Porte du Pré Saint-Gervais ", "Avenue du Belvédère ", 
    "Avenue du Nouveau Conservatoire ", "Boulevard MacDonald ", "Boulevard Sérurier ", "Boulevard d' Algérie ", "Boulevard d' Indochine ", 
    "Boulevard de la Commanderie ", "Boulevard de la Villette ", "Cité Florentine ", "Cité Hiver ", "Cité Jandelle ", "Cité Lepage ", "Cité Pottier ", 
    "Cité Saint-Chaumont ", "Cité Stemler ", "Cité du Palais Royal de Belleville ", "Galerie de la Villette ", "Hameau du Danube ", "Impasse Grimaud ", 
    "Impasse Pétin ", "Impasse Saint-Vincent ", "Impasse de Joinville ", "Impasse des Anglais ", "Impasse des Rigaunes ", "Impasse du Maroc ", 
    "Passage Binder ", "Passage Desgrais ", "Passage Dubois ", "Passage Gauthier ", "Passage Goix ", "Passage Nafissa Sid Cara ", "Passage Wattieaux ", 
  "Passage de Crimée ", "Passage de Flandre ", "Passage de Melun ", "Passage de Thionville ", "Passage de Verdun ", "Passage de l' Atlas ", 
  "Passage de la Brie ", "Passage de la Moselle ", "Passage des Fours à Chaux ", "Passage des Mauxins ", "Passage du Monténégro ", "Passage du Plateau ", 
  "Passage du Sud ", "Place Armand Carrel ", "Place BZ/19 ", "Place Francis Poulenc ", "Place Henri Fiszbin ", "Place Jean Rostand ", "Place Marcel Achard ", 
  "Place de Bitche ", "Place de Joinville ", "Place de Rhin et Danube ", "Place de l' Argonne ", "Place de la Bataille de Stalingrad ", 
  "Place de la Fontaine aux Lions ", "Place de la Porte de Pantin ", "Place des Fêtes ", "Place du Colonel Fabien ", "Place du Général Ingold ", 
  "Place du Maroc ", "Quai de Metz ", "Rue Adolphe Mille ", "Rue Alexander Fleming ", "Rue Alexandre de Humboldt ", "Rue Alphonse Aulard ", 
  "Rue Alphonse Karr ", "Rue André Danjon ", "Rue André Dubois ", "Rue Antoinette Blanche ", "Rue Archereau ", "Rue Armand Carrel ", "Rue Arthur Rozier ", 
  "Rue Augustin Thierry ", "Rue Barbanègre ", "Rue Barrelet de Ricou ", "Rue Baste ", "Rue Bellot ", "Rue Benjamin Constant ", "Rue Botzaris ", "Rue Bouret ", 
  "Rue Burnouf ", "Rue Carducci ", "Rue Carolus-Duran ", "Rue Cavendish ", "Rue Clavel ", "Rue Clovis Hugues ", "Rue Compans ", "Rue Curial ", 
  "Rue Dampierre ", "Rue David d'Angers ", "Rue Delesseux ", "Rue Delouvain ", "Rue Duvergier ", "Rue Edgar Poe ", "Rue Edgar Varese ", "Rue Edouard Pailleron ",
   "Rue Émélie ", "Rue Emile Bollaert ", "Rue Emile Desvaux ", "Rue Erik Satie ", "Rue Eugène Jumin ", "Rue Eugénie Cotton ", "Rue Euryale Dehaynin ", 
   "Rue Evette ", "Rue Fessart ", "Rue Francis Ponge ", "Rue François Pinton ", "Rue Gaston Pinot ", "Rue Gaston Rébuffat ", "Rue Gaston Tessier ", 
   "Rue Georges Auric ", "Rue Georges Lardennois ", "Rue Georges Thill ", "Rue Germaine Tailleferre ", "Rue Goubet ", "Rue Gresset ", "Rue Hassard ", 
   "Rue Haxo ", "Rue Hector Guimard ", "Rue Henri Murger ", "Rue Henri Noguères ", "Rue Henri Ribière ", "Rue Henri Turot ", "Rue Jacques Duchesne ", 
   "Rue Janssen ", "Rue Jean Ménans ", "Rue Jean Nohain ", "Rue Jean Quarré ", "Rue Jean-Baptiste Semanaz ", "Rue Jomard ", "Rue Joseph Kosma ", 
   "Rue Jules Romains ", "Rue Labois-Rouillon ", "Rue Lally-Tollendal ", "Rue Lassus ", "Rue Lauzin ", "Rue Legrand ", "Rue Léon Giraud ", 
   "Rue Louise Thuliez ", "Rue Magenta ", "Rue Manin ", "Rue Mathis ", "Rue Mélingue ", "Rue Meynadier ", "Rue Michel Tagrine ", "Rue Miguel Hidalgo ", 
   "Rue Monjol ", "Rue Nicole Chouraqui ", "Rue Paul de Kock ", "Rue Paul Laurent ", "Rue Petit ", "Rue Petitot ", "Rue Philippe Hecht ", "Rue Pierre Girard ",
    "Rue Pierre Reverdy ", "Rue Pradier ", "Rue Préault ", "Rue Rampal ", "Rue Raymond Radiguet ", "Rue Rébeval ", "Rue Rémy de Gourmont ", "Rue Riquet ", 
    "Rue Rouvet ", "Rue Sadi Lecointe ", "Rue Sigmund Freud ", "Rue Tandou ", "Rue Vincent Scotto ", "Rue d' Alsace-Lorraine ", "Rue d' Aubervilliers ", 
    "Rue d' Hautpoul ", "Rue de Belleville ", "Rue de Bellevue ", "Rue de Cahors ", "Rue de Cambo ", "Rue de Cambrai ", "Rue de Chaumont ", "Rue de Colmar ", 
    "Rue de Crimée ", "Rue de Joinville ", "Rue de Kabylie ", "Rue de Lorraine ", "Rue de Lunéville ", "Rue de Meaux ", "Rue de Mouzaïa ", "Rue de Nantes ", 
    "Rue de Palestine ", "Rue de Périgueux ", "Rue de Romainville ", "Rue de Rouen ", "Rue de Soissons ", "Rue de Tanger ", "Rue de Thionville ", 
    "Rue de Toulouse ", "Rue de l' Aisne ", "Rue de l' Argonne ", "Rue de l' Atlas ", "Rue de l' Egalité ", "Rue de l' Encheval ", "Rue de l' Equerre ", 
    "Rue de l' Escaut ", "Rue de l' Inspecteur Allès ", "Rue de l' Oise ", "Rue de l' Orme ", "Rue de l' Ourcq ", "Rue de la Clôture ", "Rue de la Corrèze ", 
    "Rue de la Fraternité ", "Rue de la Gare ", "Rue de la Grenade ", "Rue de la Haie Coq ", "Rue de la Liberté ", "Rue de la Marne ", "Rue de la Marseillaise ",
     "Rue de la Meurthe ", "Rue de la Moselle ", "Rue de la Prévoyance ", "Rue de la Solidarité ", "Rue de la Villette ", "Rue des Alouettes ", "Rue des Annelets ", 
     "Rue des Ardennes ", "Rue des Bois ", "Rue des Carrières d'Amérique ", "Rue des Chaufourniers ", "Rue des Cheminets ", "Rue des Dunes ", "Rue des Fêtes ", 
     "Rue des Lilas ", "Rue des Marchais ", "Rue des Mignottes ", "Rue des Sept Arpents ", "Rue des Solitaires ", "Rue du Département ", "Rue du Docteur Lamaze ",
      "Rue du Docteur Potain ", "Rue du Général Brunet ", "Rue du Général Lasalle ", "Rue du Hainaut ", "Rue du Léman ", "Rue du Maroc ", "Rue du Noyer Durand ",
       "Rue du Plateau ", "Rue du Pré Saint-Gervais ", "Rue du Rhin ", "Rue du Tunnel ", "Sente à Bigot ", "Sente des Dorées ", "Square Bolivar ", 
       "Square La Champmeslé ", "Square d' Aquitaine ", "Square des Bouleaux ", "Square du Diapason ", "Square du Laonnais ", "Square du Vermandois ", 
       "Square du Vexin ", "suite E ", "suite M ", "Terrasse du Parc ", "Allée Alquier-Debrousse ", "Allée Georges Rouault ", "Allée Marie Laurent ", "Allée du Père Julien Dhuit ", "Avenue Cartellier ", 
       "Avenue Gambetta ", "Avenue de la Porte de Bagnolet ", "Avenue de la Porte de Ménilmontant ", "Avenue de la Porte de Montreuil ", 
       "Avenue de la Porte de Vincennes ", "Avenue de la Porte des Lilas ", "Avenue du Docteur Gley ", "Avenue du Père Lachaise ", "Boulevard Davout ", 
       "Boulevard Mortier ", "Boulevard de Belleville ", "Boulevard de Charonne ", "Boulevard de Ménilmontant ", "Chemin du Parc de Charonne ", "Cité Adrienne ", "Cité Aubry ", "Cité Champagne ", "Cité Georges-Ambroise-Boisselat-et-Blanche ", "Cité Leclaire ", "Cité Leroy ", 
       "Cité de Gênes ", "Cité de l' Ermitage ", "Cité des Ecoles ", "Cité du Labyrinthe ", "Cour Lesage ", "Cour de la Métairie ", "Impasse Basilide Fossard ", "Impasse Casteggio ", "Impasse Eveillard ", "Impasse Gros "]

    @users = User.all
    @users.each do |user|
      if user.location.nil?

        n= rand(1..100).to_s
        r = streets[rand(1.. streets.count)]
        a =  n + " " + r + " 75000 Paris"
        
        Location.create(user_id: user.id, address: a)
        
      end
    end
end
