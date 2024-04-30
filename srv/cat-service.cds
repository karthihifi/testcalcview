using my.bookshop as my from '../db/data-model';
using V_AUTHORS from '../db/data-model';
using V_TESTCOUNTER from '../db/data-model';


service CatalogService {
    @readonly
    entity Books            as projection on my.Books;

    @readonly
    entity Authors          as projection on my.Authors;

    @readonly
    entity BooksToAuthors   as
        projection on my.booksToAuthors {
            *,
            object,
            book   : redirected to Books,
            author : redirected to Authors
        }
        where
            object = 'BookToAuthor';

    @readonly
    entity V_AuthorsByBooks as projection on V_TESTCOUNTER;
}
