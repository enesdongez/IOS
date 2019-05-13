# Ayraç Uyguluması

 Ayraç uygulaması kullanıcılara kontrollü giriş imkânıyla uygulamanın içerisindeki güncel kitap listesine erişebilmeyi sağlar.
Giriş yapan kullanıcı kitap listesindeki okuduğu kitapları kendi profiline ekleyebilmektedir. Uygulamamız genel olarak da kayıtlı 
kullanıcıların birbirlerinin profillerine erişip okudukları kitapların listelerini inceleyebilmeleri için geliştirilmiştir.

 Uygulamamızın genel yapısından bahsetmek gerekirse, kullanıcı kendi hesabına e-mail ve şifresi ile erişmektedir. Uygulamaya 
kayıt olmak isteyen kullanıcı  ‘Kayıt Ol’ butonuna tıklayarak ad soyad, kullanıcı adı, e-mail ve şifre ile kayıt olabilmektedir. 
Giriş yapan kullanıcı güncel kitap listesine erişim sağlar. Kullanıcılar uygulamanın veritabanında kayıtlı olan kitapların üzerine 
tıklayarak kitabın adını, kitabın yazarını, sayfa sayısını ve özetini detaylı bir şekilde görebilmektedirler, bu sayede kullanıcılara
o kitap hakkında kısa bir bilgilendirme yapmış oluyoruz. Aynı zamanda bir kullanıcı, kayıtlı olan bir kitabın detay bölümüne girdiği
zaman o kitabı okudu ise sayfanın sağ üst bölümünde bulunan ‘+’ butonuna tıklayarak o kitabın adını ve yazarını kendi profilinde bulunan 
kitaplar listesine ekleyebilir. Uygulamamızı kullanan kullanıcıların listesini anasayfada bulunan ‘Kullanıcılar’ bölümünden ulaşabilir ve bu 
listeden istediği kullanıcının profiline ulaşıp o kullanıcının okuduğu kitapları inceleyebilir. Anasayfada bulunan ‘Hakkımızda’ bölümünden de
uygulamanın sürüm numarasını ve uygulamanın geliştirilmesinde katkısı bulunan kişilerin adlarını bulabilirsiniz.

 Uygulamamız Firebase altyapısı ile geliştirilmiştir. Firebase platformunda gerçek zamanlı veritabanı ile kullanıcı bilgileri ve kitap verilerini 
tutmaktayız. İnternet erişimi olan her noktadan uygulamaya giriş yapıp diğer kullanıcıların profillerine ve güncel kitap listesine erişim sağlanabilir.
