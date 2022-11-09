gong_cha = Shop.create(name: "Gong Cha", address: "40-44 Harrison Ave", city: "Chinatown", state: "MA", zip: "02111", telephone: "(617) 574-4870", website: "https://gongchausa.com/", picture: "https://bdc2020.o0bc.com/wp-content/uploads/2022/08/Gong-Cha-630e244f838ea.jpeg")
one_zo = Shop.create(name: "One Zo", address: "83 Harrison Ave", city: "Chinatown", state: "MA", zip: "02111", telephone: "(617) 982-6985", website: "https://www.onezo.us/", picture: "https://d1ralsognjng37.cloudfront.net/c370272a-288b-4a80-b0d5-ccdfe11abece.jpeg")
tea_do = Shop.create(name: "Tea Do", address: "8 Tyler St", city: "Chinatown", state: "MA", zip: "02111", telephone: "(617) 988-8002", website: "http://teadoboston.com", picture: "https://pbs.twimg.com/media/FSfWKtMX0AQEECY?format=jpg&name=large")
ten_one = Shop.create(name: "Ten One Tea House", address: "279 Newbury St", city: "Back Bay", state: "MA", zip: "02116", telephone: "(774) 371-3195", website: "https://www.tenoneteahouse.com/", picture: "https://d1ralsognjng37.cloudfront.net/d0e9c8b7-b222-4f9c-ba21-ad49a1ed72bb.jpeg")
sweet_waffles = Shop.create(name: "Sweet Waffles + Boba", address: "18 Hudson St", city: "Chinatown", state: "MA", zip: "02111", telephone: " (617) 357-7634", website: "sweetwafflesandboba.com", picture: "https://s3-media0.fl.yelpcdn.com/bphoto/jD4ImiPB-mT4k0jj0IpNVA/o.jpg")
kft = Shop.create(name: "Kung Fu Tea", address: "131 Harvard Ave,", city: "Allston", state: "MA", zip: "02134", telephone: "(617) 783-3388", website: "https://kungfutea.com/menu/", picture: "https://communityimpact.com/uploads/images/2022/01/21/177480.jpg")
coco_leaf = Shop.create(name: "Coco Leaf", address: "1480 Dorchester Ave", city: "Dorchester", state: "MA", zip: "02122", telephone: "(617) 506-0010", website: "http://www.cocoleafboston.com", picture: "https://s3-media0.fl.yelpcdn.com/bphoto/At9W0ky7Eh8zC_lkzWbDCw/l.jpg")
bambu = Shop.create(name: "Bambu", address: "287 Adams St", city: "Dorchester", state: "MA", zip: "02122", telephone: "(617) 533-7030", website: "http://www.drinkbambu.com", picture: "https://d1ralsognjng37.cloudfront.net/3072b102-9614-4ff3-9812-e8a4fc1a5783.jpeg")
shinmio = Shop.create(name: "Shinmio", address: "900 Beacon St Unit D", city: "Boston", state: "MA", zip: "02215", telephone: "(617) 936-3440", website: "http://shinmio.com", picture: "https://s3-media0.fl.yelpcdn.com/bphoto/1NKyIoU2zCp0SyyiuqrGPA/o.jpg")
royal_tea = Shop.create(name: "Royal Tea", address: "162 Harvard Ave", city: "Allston", state: "MA", zip: "02134", telephone: "(617) 208-8671", website: "https://www.royalteaus.com/", picture: "https://static.wixstatic.com/media/177d1c_e9bb4ea7b1ef4718ab5a3cb0ed943370~mv2_d_2500_1667_s_2.jpg/v1/fit/w_2500,h_1330,al_c/177d1c_e9bb4ea7b1ef4718ab5a3cb0ed943370~mv2_d_2500_1667_s_2.jpg")
tiger_sugar = Shop.create(name: "Tiger Sugar", address: "181 Harvard Ave", city: "Allston", state: "MA", zip: "02134", telephone: "(917) 818-7661", website: "https://tigersugar.co", picture: "https://d1ralsognjng37.cloudfront.net/68d1d16b-a4a4-414b-a594-780d4a20ecbd.jpeg")
tbaar = Shop.create(name: "TBaar", address: "32 Kneeland St", city: "Chinatown", state: "MA", zip: "02111", telephone: "(617) 728-3688", website: "tbaarchinatown.com", picture: "https://s3-media0.fl.yelpcdn.com/bphoto/oKlByYUBKRJ-EuR6-1fHqw/o.jpg")


katie = User.create(first_name: "Katie", last_name: "Foley", email: "katief906@gmail.com", password: "Ilovecoding4fun!", role: "admin")
karen = User.create(first_name: "Karen", last_name: "Wong", email: "karen@aol.com", password: "Bobalover2022")
alana = User.create(first_name: "Alana", last_name: "Lee", email: "alana@outlook.com", password: "Earlgraymilktea4life")

review_1 = Review.create(rating: 5, body: "Best Earl Gray milk tea EVER!", shop: gong_cha, user: katie)
review_2 = Review.create(rating: 4, body: "Great but very sweet", shop: one_zo, user: karen)
