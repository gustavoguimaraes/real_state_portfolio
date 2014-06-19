# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Creating SEED data"
house_image = File.new(File.join(Rails.root,'features', 'fixtures', 'house.jpg'))
gallery_image = File.new(File.join(Rails.root,'features', 'fixtures', 'sample.jpg'))

Listing.delete_all

FactoryGirl.create(:neighborhood)
FactoryGirl.create_list(:condo, 5, headline_image: house_image)
FactoryGirl.create_list(:coop, 5, headline_image: house_image)

FactoryGirl.create_list(:house, 5, headline_image: house_image)
FactoryGirl.create(:rental, headline_image: house_image, status: "Sold", neighborhood: Neighborhood.first, description: "Kitten Ipsum sleeping lure house impressed sneak name loves spoon petting snickers grazing tux, mom 9th buddy her my cats stretching box psycho loves. Pillow feel, sister's she tabby awesomeness spoon sit helped local catnip ragdoll couch cat's. Muffin lay down in your way nap cat meowschwitz hiss, her rip the couch mom's home sleep on your keyboard. Living kitties Jinx kitty kitten furball spot whisker Zooey, caught long hair long hair disapproval passive jump on the table old brought kitty cats tabby discovered catnip roof nap her. Hiding, socks toss the mousie fire cat friend this sucked?  Trust oscar love cat thinks kitten helped his family, cats rescue little kittens catnip! Her, kittens derp cat tabby backyard discovered?" )
FactoryGirl.create(:rental, headline_image: house_image, status: "In Contract", description: "Grandparents life grown cat's Baxter, waffles cat house cats. Belly thinks honey bed climb the curtains box cat living turbo sister kitten chilling norwegian forest cat slept hai. Wish, cat tabby stowaway her down. Trust oscar love cat thinks kitten helped his family, cats rescue little kittens catnip! Her, kittens derp cat tabby backyard discovered?")
FactoryGirl.create(:rental, headline_image: house_image, publish: "Unpublish", description:"Gizmo boots sleeping in the sink nap kitten headbutt birdwatch his persian friendly finally yoda, pants socks buddy friend petting. She's special leo cat give me fish she craig name dog pillow spoon sucked mom birdwatch zzz front sucked girlfriend reddit. Chuf shenanigans mom's baby kitty stuck in a tree 9 lives he vet, baby thinks he she curls ham if I fits I sits loves Gizmo meowlly age she snuggle psycho. Neighbors little leo she ball meet kitten standing fight her finally ")
FactoryGirl.create(:rental, headline_image: house_image, description: "Living pride photobomb fluffy family eyes model helped he, kittens standing around impressed standing ragdoll rescue. Little eat bat, his siam smile keyboard gf's tail. Cat hai watching smile this Mr. Kitty cat sleeps hiss tongue reddit curls boy beautiful his vet. Meet, fun old tiny snuggle kitten. Sleeps she's cute saving claw run derp cats cats sister's. Kills, boy ham ambush slept wish birthday classy she snuggliest. Boots, kitten french best adoption puss and boots her age.")
FactoryGirl.create(:rental, headline_image: house_image, description:"Wonderful kitty sandi, siamese outside home cat looks sunbathe snuggliest cramped awesomeness photobomb she sleeps watched kat baby fluff backyard. Scottish fold cat healing sleep on your keyboard tabby bed run attack tabby headbutt happy her she! Cat kitten picture catnip bites kitten she kitty awesomeness. Royal, her name toilet flying.")
FactoryGirl.create(:rental, headline_image: house_image, description: "Kitty beautiful cat hot cat room boy boy if I fits I sits rip year chuf toss the mousie sister's cat he her catnip 9 her siamese happy mom! My redditor helped aww lady kitty meowlly hairball favorite her, me somebody lounging adoption years fluffy? Backyard friend success bed she little boy climb the curtains fluffy? Kills friends sits terrified wish chuf purses belly cat cat cat sunbathe white dogs. Buddy cats medium hair, cats catnip box year his drinks outside sits highness prince cat life cat toss the mousie brought pants cute cute. Mix, roof cats steal cuddling.")

FactoryGirl.create(:house_with_images, headline_image: house_image, neighborhood: Neighborhood.first)
FactoryGirl.create_list(:image, 6, gallery_image: gallery_image, listing_id: 22 )

FactoryGirl.create_list(:image, 6, gallery_image: gallery_image, listing_id: 21 )
FactoryGirl.create(:open_house, listing_id: (Listing.where(listing_type: "House").first.id))
FactoryGirl.create(:open_house, listing_id: (Listing.where(listing_type: "House").first.id), start_time: Time.now + 1.hour, end_time: Time.now + 2.hour)
