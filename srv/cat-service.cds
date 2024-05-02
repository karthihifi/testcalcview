using my.bookshop as my from '../db/data-model';
// using V_AUTHORS from '../db/data-model';
// using V_TESTCOUNTER from '../db/data-model';
using CV_TESTBOOKCOUNT from '../db/data-model';


service CatalogService {
    @readonly
    entity Books                              as projection on my.Books;

    @readonly
    entity Authors                            as projection on my.Authors;

    @readonly
    entity BooksToAuthors                     as
        projection on my.booksToAuthors {
            *,
            object,
            book   : redirected to Books,
            author : redirected to Authors
        }
        where
            object = 'BookToAuthor';

    entity Books1                             as
        projection on my.Books {
            ID,
            translation.title,
            stock,
            translation.localized.locale
        };

    // @readonly
    // entity testCount(IP_EMAIL : String, IP_LANG : String) as projection on my.testView(IP_EMAIL : :IP_EMAIL, IP_LANG : :IP_LANG);

    // @readonly
    // entity testCount                                            as projection on my.testView;

    @readonly
    entity BookTexts                          as projection on my.BookTexts;

    // @readonly
    // entity testCount1(IP_EMAIL : String, IP_LANG : String)                     as
    //     select from my.testView (
    //         IP_EMAIL: :IP_EMAIL, IP_LANG: :IP_LANG
    //     ) {
    //         NAME,
    //         EMAIL,
    //         BOOKCOUNT,
    //         BOOK_ID
    //     };

    // @readonly
    // entity testCount1(IP_EMAIL : String)                        as
    //     select from my.testView {
    //         NAME,
    //         EMAIL,
    //         BOOKCOUNT,
    //         BOOK_ID,
    //         Book.title
    //     }
    //     where
    //         EMAIL = :IP_EMAIL;

    // @readonly
    // entity AuthorsByBooks  as projection on CV_TESTBOOKCOUNT;

    @readonly
    entity AuthorsByBooks1(IP_EMAIL : String) as
        select from CV_TESTBOOKCOUNT (
            IP_EMAIL: :IP_EMAIL
        ) {
            EMAIL,
            NAME,
            BOOKCOUNT
        };

    @readonly
    entity AuthorsByBooks2(IP_EMAIL : String) as
        select from CV_TESTBOOKCOUNT (
            IP_EMAIL: :IP_EMAIL, IP_LANG:$user.locale
        ) {
            EMAIL,
            NAME,
            BOOKCOUNT,
            TITLE,
            LOCALE
        };

// entity AuthorsByBooks2(IP_EMAIL : String) as
//     select from CV_TESTBOOKCOUNT {
//         EMAIL,
//         NAME,
//         BOOKCOUNT
//     }
//     where
//         EMAIL = :IP_EMAIL;
}
