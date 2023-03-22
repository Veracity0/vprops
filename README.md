# vprops
Veracity's property management library.

### What is this for?

This is an ASH library for use by ASH scripts that allow user configuration.
Rather than requiring the user to edit the script and change variables, configuration variables are stored in properties.
These properties have default values (specified in your script).

### Installation:
```
git checkout Veracity0/vprops
```

### How do you use it?
Install it and add the following line at the top of your script:

```
import <vprops.ash>;
```
Add a section telling users how to do configuration. Here is my boilerplate:

```
// ***************************
//       Configuration       *
// ***************************

//-------------------------------------------------------------------------
// All of the configuration variables have default values, which apply
// to any character who does not override the variable using the
// appropriate property.
//
// You can edit the default here in the script and it will apply to all
// characters which do not override it.
//
// define_property( PROPERTY, TYPE, DEFAULT )
// define_property( PROPERTY, TYPE, DEFAULT, COLLECTION )
// define_property( PROPERTY, TYPE, DEFAULT, COLLECTION, DELIMITER )
//
// Otherwise, you can change the value for specific characters in the gCLI:
//
//     set PROPERTY=VALUE
//
// Both DEFAULT and a property VALUE will be normalized
//
// All properties used directly by this script start with "XXX."
//-------------------------------------------------------------------------
```
Add your configuration variables:
```
// Whether to actually run turns, or just look at and report on things.

boolean run_turns = define_property( "XXX.RunTurns", "boolean", "true" ).to_boolean();

// What are your favorite colors? There's no limit (stretching the definition of "favorite").
// Include them all, separating them with "|" characters.

string_list favorite_colors = define_property( "XXX.FavoriteColors", "string", "red|green|blue", "list" );
```
### What are the valid TYPEs for data?

In KoLmafia, a property maps a "string" name to a "string" value. Therefore, in your preferences (property) file, all values are strings.
That's inadequate for most programs, so vprops lets you use all the (simple) built-in KoLmafia data types, which have built-in functions to convert to or from a string.

| type | string -> type | type -> string |
| :-- | :-- | :-- |
| string | | |
| boolean | boolean to_boolean( string ) | string to_string( boolean ) |
| int | int to_int( string ) | string to_string( int ) |
| float | float to_float( string ) | string to_string( float ) |
| item | item to_item( string ) | string to_string( item ) |
| location | location to_location( string ) | string to_string( location ) |
| class | class to_class( string ) | string to_string( class ) |
| stat | stat to_stat( string ) | string to_string( stat ) |
| skill | skill to_skill( string ) | string to_string( skill ) |
| effect | effect to_effect( string ) | string to_string( effect ) |
| familiar | familiar to_familiar( string ) | string to_string( familiar ) |
| slot | slot to_slot( string ) | string to_string( slot ) |
| monster | monster to_monster( string ) | string to_string( monster ) |
| element | element to_element( string ) | string to_string( element ) |
| phylum | phylum to_phylum( string ) | string to_string( phylum ) |
| coinmaster | coinmaster to_coinmaster( string ) | string to_string( coinmaster ) |
| thrall | thrall to_thrall( string ) | string to_string( thrall ) |
| bounty | bounty to_bounty( string ) | string to_string( bounty ) |
| servant | servant to_servant( string ) | string to_string( servant ) |
| vykea | vykea to_vykea( string ) | string to_string( vykea ) |

I just noticed that I am missing the recently added "path" data type.
I will fix that.

### What is a COLLECTION?

A "list" is an ordered collection, allowing duplicates ->
```TYPE [int]```

A "set" is an unordered collection with no duplicates ->
```boolean [TYPE]```

The string representation of this is the string represenation of all te
elements, separated by a "|" character (by default; you can choose your
own delimiter),

### How do you support collections?

We define typedefs for each type:
```
typedef boolean [int] int_set;
typedef int [int] int_list;
```
and provide conversion functions in both directions:
```
int_set to_int_set( string set_val );
string to_string( int_set set_val );

int_set to_int_set( string set_val, string delimiter );
string to_string( int_set set_val, string delimiter );

int_list to_int_list( string list_val );
string to_string( int_list list_val );

int_list to_int_list( string list_val, string delimiter );
string to_string( int_list list_val, string delimiter );
```
### Tell me more about ```define_property.```
```define_property``` specifies that a particular property with NAME is of type TYPE.

Optionally, you can declare that the value is a COLLECTION (either "list" or "set") with a DELIMITER.

NAME can be either built-in to KoLmafia or a custom user property.

If it is a custom property, you can specify a DEFAULT value

- If the property exists, define_property will fetch the value, normalize it, and return it.
- If the property is custom and the normalized value equals the normalized default value, the property will be removed.
- If the property is custom and the value is not normalized, the property will be set with the normalized value.
- If the property does not exist, define_property will return the (normalized) default value and the property will remain unset.

You can use these in conjunction with the appropriate coercion function to extract the value of a property into the appropriate data type. For example:

```
int prop1 = define_property( "prop1", "int", "12" ).to_int();
boolean prop2 = define_property( "prop2", "boolean", "true" ).to_boolean();
item prop3 = define_property( "prop3", "item", "snorkel" ).to_item();
item_set prop4 = define_property( "prop4", "item", "snorkel|seal tooth", "set" ).to_set_of_item();
string_list prop5 =  define_property( "prop5", "string", "str1,str2,str3", "list", "," ).to_list_of_string( "," );
```