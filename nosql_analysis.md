 Part 2: NoSQL Database Analysis – FlexiMart

# Section A: Limitations of RDBMS (Relational Databases)

Relational databases such as MySQL work well when data follows a fixed and predictable structure. However, FlexiMart’s expanding product catalog contains highly diverse products, which creates multiple challenges. Products like smartphones, laptops, shoes, and clothing all have different attributes. For example, electronics require technical specifications such as RAM, processor, and battery, while fashion products require attributes like size, color, and material. In a relational database, handling these differences would require either many nullable columns or multiple separate tables, making the schema complex and inefficient.

Frequent schema changes are another limitation. Whenever FlexiMart introduces a new product type with new attributes, the relational schema must be altered using costly schema migrations. These changes can cause downtime and require significant maintenance effort. Additionally, storing customer reviews in a relational database is inefficient because reviews are naturally nested within products. Representing this in MySQL requires multiple tables and joins, which increases query complexity and reduces performance.

Overall, rigid schema design, complex joins, and difficulty handling nested and evolving data make relational databases less suitable for FlexiMart’s dynamic product catalog.


# Section B: Benefits of MongoDB (NoSQL Database)

MongoDB addresses these challenges by using a flexible, document-based data model. Each product is stored as a JSON-like document, allowing different products to have different attributes without enforcing a fixed schema. For example, electronics can store technical specifications such as RAM and processor, while fashion products can store sizes and materials in the same collection. This flexibility allows FlexiMart to add new product types without modifying the database structure.

MongoDB also supports embedded documents, which makes it ideal for storing customer reviews directly inside product documents. Reviews, ratings, and comments can be nested within a product, enabling faster read operations and eliminating the need for complex joins. This structure closely matches real-world data representation.

In addition, MongoDB offers horizontal scalability through sharding. As FlexiMart’s product catalog and user base grow, MongoDB can distribute data across multiple servers, ensuring high availability and performance. These features make MongoDB highly suitable for handling diverse, evolving, and large-scale product data.



# Section C: Trade-offs of Using MongoDB

Despite its advantages, MongoDB has some disadvantages compared to MySQL. First, MongoDB provides weaker support for complex multi-table transactions. While transactions are supported, relational databases are generally better suited for scenarios requiring strict ACID compliance across multiple related entities, such as financial operations.

Second, MongoDB can lead to data duplication due to embedded documents. For example, storing reviews inside product documents may increase storage usage and make updates more difficult if the same data needs to be shared across multiple documents. Therefore, MongoDB is best suited for flexible and read-heavy workloads, while MySQL remains more reliable for highly structured transactional systems.
