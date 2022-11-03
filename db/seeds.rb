gong_cha = Shop.create(name: "Gong Cha", address: "40-44 Harrison Ave", city: "Boston", state: "MA", zip: "02111", telephone: "(617) 574-4870", website: "https://gongchausa.com/", picture: "https://bdc2020.o0bc.com/wp-content/uploads/2022/08/Gong-Cha-630e244f838ea.jpeg")
one_zo = Shop.create(name: "One Zo", address: "83 Harrison Ave", city: "Boston", state: "MA", zip: "02111", telephone: "(617) 982-6985", website: "https://www.onezo.us/", picture: "https://d1ralsognjng37.cloudfront.net/c370272a-288b-4a80-b0d5-ccdfe11abece.jpeg")

katie = User.create(email: "katief906@gmail.com", password: "Ilovecoding4fun!")
karen = User.create(email: "karen@aol.com", password: "Bobalover2022")
alana = User.create(email: "alana@outlook.com", password: "Earlgraymilktea4life")

review_1 = Review.create(rating: 5, body: "Best Earl Gray milk tea EVER!", shop: gong_cha, user: katie)
review_2 = Review.create(rating: 4, body: "Great but very sweet", shop: one_zo, user: karen)
