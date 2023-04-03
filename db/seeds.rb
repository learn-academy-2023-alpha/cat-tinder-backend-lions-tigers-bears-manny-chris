beasts = [
    {
        name: 'Tony',
        age: 30,
        description: 'Grrrrrreaaaaat match',
        image: 'https://live.staticflickr.com/105/254081788_9c4335692d_b.jpg'
    },
    {
        name: 'Simba',
        age: 40,
        description: 'Just cant wait to be king',
        image: 'https://static.standard.co.uk/s3fs-public/thumbnails/image/2018/11/23/12/lion-king-simba-higher-quality.jpg?width=1200'
    },
    {
        name: 'Nala',
        age: 35,
        description: 'Waiting for my king to come home',
        image: 'https://s.yimg.com/ny/api/res/1.2/jviduw5NzRTSgTQh3k.EJQ--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTM2MA--/https://media-mbst-pub-ue1.s3.amazonaws.com/creatr-uploaded-images/2019-07/33dfdee0-a24a-11e9-9fef-9e1c081b5670'
    },
    {
        name: 'Mufasa',
        age: 60,
        description: 'Dont go where the dark touches',
        image: 'https://lumiere-a.akamaihd.net/v1/images/607598d0230e6a00018e21b2-image_354b1b56.jpeg?region=0%2C48%2C1536%2C768'
    },
    {
        name: 'Scar',
        age: 65,
        description: 'Just want to be king',
        image: 'https://photos.costume-works.com/full/teacher_gone_wild1.jpg'
    }
]

beasts.each do |each_beast|
    Beast.create each_beast
    puts "creating beast #{each_beast}"
end