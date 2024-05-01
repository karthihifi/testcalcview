using my.bookshop as my from '../db/data-model';
// using V_AUTHORS from '../db/data-model';
// using V_TESTCOUNTER from '../db/data-model';
using CV_TESTBOOKCOUNT from '../db/data-model';


service CatalogService {
    @readonly
    entity Books           as projection on my.Books;

    @readonly
    entity Authors         as projection on my.Authors;

    @readonly
    entity BooksToAuthors  as projection on my.booksToAuthors {
        *,
        object,
        book   : redirected to Books,
        author : redirected to Authors
    } where object = 'BookToAuthor';

    entity Books1          as projection on my.Books {
        ID,
        translation.title,
        stock,
        translation.localized.locale
    };

    @readonly
    entity testCount       as projection on my.testView;

    @readonly
    entity testCount1      as
        select from my.testView {
            NAME,
            EMAIL,
            BOOKCOUNT,
            Book.title
        };
    // @readonly
    // entity AuthorsByBooks  as projection on CV_TESTBOOKCOUNT;

    @readonly
    entity AuthorsByBooks1 as
        select from CV_TESTBOOKCOUNT {
            EMAIL,
            NAME,
            BOOKCOUNT
        };
}
