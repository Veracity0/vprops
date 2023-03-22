since r20091;

// Properties are mappings from string to string: a (string) name has a (string) value.
//
// The string value can represent one of the following simple ASH data types:
//
// "string"
// "boolean"	boolean to_boolean( string ); string to_string( boolean );
// "int"	int to_int( string ); string to_string( int );
// "float"	float to_float( string ); string to_string( float );
// "item"	item to_item( string ); string to_string( item );
// "location"	location to_location( string ); string to_string( location );
// "class"	class to_class( string ); string to_string( class );
// "stat"	stat to_stat( string ); string to_string( stat );
// "skill"	skill to_skill( string ); string to_string( skill );
// "effect"	effect to_effect( string ); string to_string( effect );
// "familiar"	familiar to_familiar( string ); string to_string( familiar );
// "slot"	slot to_slot( string ); string to_string( slot );
// "monster"	monster to_monster( string ); string to_string( monster );
// "element"	element to_element( string ); string to_string( element );
// "phylum"	phylum to_phylum( string ); string to_string( phylum );
// "coinmaster"	coinmaster to_coinmaster( string ); string to_string( coinmaster );
// "thrall"	thrall to_thrall( string ); string to_string( thrall );
// "bounty"	bounty to_bounty( string ); string to_string( bounty );
// "servant"	servant to_servant( string ); string to_string( servant );
// "vykea"	vykea to_vykea( string ); string to_string( vykea );
//
// They can also represent collections of those simple types:
//
// "list" -> TYPE [int] - an ordered collection, allowing duplicates.
// "set" -> boolean [TYPE] - an unordered collection with no duplicates
//
// Collections are put into strings by listing them in the natural order
// of the key, separated by a delimiter character. By default, the
// delimiter is "|", but "," or ";" or anything else can be used
//
// (Internally, this uses split_string(), which takes a regex, not a
// string. Since "|" is a special character in a regex, for convenience,
// we turn "|" into "\\|". But you are welcome to use an actual regex,
// rather than a "delimiter character" if you wish.)
//
// Since the key of a "list" is an int, the elements of the list are
// ordered and duplicate values are allowed.
//
// Since the key of a "set" is any datatype, the elements of the set
// are not ordered and duplicate keys are not allowed.

// You can use the appropriate built-in ASH function to convert between
// simple ASH data types and a string, or vice versa, as listed above.
//
// This package provides coercion functions for "list" and "set" types.
// The versions without "delimiter" assume "|".

string [int] fixed_split_string( string input, string delimiter )
{
    static string[] EMPTY_ARRAY;
    if ( input == "" ) {
	return EMPTY_ARRAY;
    }
    string delim = delimiter == "|" ? "\\|" : delimiter;
    return input.split_string( delim );
}

typedef boolean [boolean] boolean_set;
typedef boolean [int] int_set;
typedef boolean [float] float_set;
typedef boolean [string] string_set;
typedef boolean [item] item_set;
typedef boolean [location] location_set;
typedef boolean [class] class_set;
typedef boolean [stat] stat_set;
typedef boolean [skill] skill_set;
typedef boolean [effect] effect_set;
typedef boolean [familiar] familiar_set;
typedef boolean [slot] slot_set;
typedef boolean [monster] monster_set;
typedef boolean [element] element_set;
typedef boolean [phylum] phylum_set;
typedef boolean [coinmaster] coinmaster_set;
typedef boolean [thrall] thrall_set;
typedef boolean [bounty] bounty_set;
typedef boolean [servant] servant_set;
typedef boolean [vykea] vykea_set;

typedef boolean [int] boolean_list;
typedef int [int] int_list;
typedef float [int] float_list;
typedef string [int] string_list;
typedef item [int] item_list;
typedef location [int] location_list;
typedef class [int] class_list;
typedef stat [int] stat_list;
typedef skill [int] skill_list;
typedef effect [int] effect_list;
typedef familiar [int] familiar_list;
typedef slot [int] slot_list;
typedef monster [int] monster_list;
typedef element [int] element_list;
typedef phylum [int] phylum_list;
typedef coinmaster [int] coinmaster_list;
typedef thrall [int] thrall_list;
typedef bounty [int] bounty_list;
typedef servant [int] servant_list;
typedef vykea [int] vykea_list;

boolean_set to_boolean_set( string set_val, string delimiter )
{
    boolean_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_boolean( str ) ] = true;
    }
    return retval;
}

boolean_set to_boolean_set( string set_val )
{
    return to_boolean_set( set_val, "|" );
}

string to_string( boolean_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( boolean_set set_val )
{
    return to_string( set_val, "|" );
}

int_set to_int_set( string set_val, string delimiter )
{
    int_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_int( str ) ] = true;
    }
    return retval;
}

int_set to_int_set( string set_val )
{
    return to_int_set( set_val, "|" );
}

string to_string( int_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( int_set set_val )
{
    return to_string( set_val, "|" );
}

float_set to_float_set( string set_val, string delimiter )
{
    float_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_float( str ) ] = true;
    }
    return retval;
}

float_set to_float_set( string set_val )
{
    return to_float_set( set_val, "|" );
}

string to_string( float_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( float_set set_val )
{
    return to_string( set_val, "|" );
}

string_set to_string_set( string set_val, string delimiter )
{
    string_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ str ] = true;
    }
    return retval;
}

string_set to_string_set( string set_val )
{
    return to_string_set( set_val, "|" );
}

string to_string( string_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( it );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( string_set set_val )
{
    return to_string( set_val, "|" );
}

item_set to_item_set( string set_val, string delimiter )
{
    item_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_item( str ) ] = true;
    }
    return retval;
}

item_set to_item_set( string set_val )
{
    return to_item_set( set_val, "|" );
}

string to_string( item_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( item_set set_val )
{
    return to_string( set_val, "|" );
}

location_set to_location_set( string set_val, string delimiter )
{
    location_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_location( str ) ] = true;
    }
    return retval;
}

location_set to_location_set( string set_val )
{
    return to_location_set( set_val, "|" );
}

string to_string( location_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( location_set set_val )
{
    return to_string( set_val, "|" );
}

class_set to_class_set( string set_val, string delimiter )
{
    class_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_class( str ) ] = true;
    }
    return retval;
}

class_set to_class_set( string set_val )
{
    return to_class_set( set_val, "|" );
}

string to_string( class_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( class_set set_val )
{
    return to_string( set_val, "|" );
}

stat_set to_stat_set( string set_val, string delimiter )
{
    stat_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_stat( str ) ] = true;
    }
    return retval;
}

stat_set to_stat_set( string set_val )
{
    return to_stat_set( set_val, "|" );
}

string to_string( stat_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( stat_set set_val )
{
    return to_string( set_val, "|" );
}

skill_set to_skill_set( string set_val, string delimiter )
{
    skill_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_skill( str ) ] = true;
    }
    return retval;
}

skill_set to_skill_set( string set_val )
{
    return to_skill_set( set_val, "|" );
}

string to_string( skill_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( skill_set set_val )
{
    return to_string( set_val, "|" );
}

effect_set to_effect_set( string set_val, string delimiter )
{
    effect_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_effect( str ) ] = true;
    }
    return retval;
}

effect_set to_effect_set( string set_val )
{
    return to_effect_set( set_val, "|" );
}

string to_string( effect_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( effect_set set_val )
{
    return to_string( set_val, "|" );
}

familiar_set to_familiar_set( string set_val, string delimiter )
{
    familiar_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_familiar( str ) ] = true;
    }
    return retval;
}

familiar_set to_familiar_set( string set_val )
{
    return to_familiar_set( set_val, "|" );
}

string to_string( familiar_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( familiar_set set_val )
{
    return to_string( set_val, "|" );
}

slot_set to_slot_set( string set_val, string delimiter )
{
    slot_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_slot( str ) ] = true;
    }
    return retval;
}

slot_set to_slot_set( string set_val )
{
    return to_slot_set( set_val, "|" );
}

string to_string( slot_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( slot_set set_val )
{
    return to_string( set_val, "|" );
}

monster_set to_monster_set( string set_val, string delimiter )
{
    monster_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_monster( str ) ] = true;
    }
    return retval;
}

monster_set to_monster_set( string set_val )
{
    return to_monster_set( set_val, "|" );
}

string to_string( monster_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( monster_set set_val )
{
    return to_string( set_val, "|" );
}

element_set to_element_set( string set_val, string delimiter )
{
    element_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_element( str ) ] = true;
    }
    return retval;
}

element_set to_element_set( string set_val )
{
    return to_element_set( set_val, "|" );
}

string to_string( element_set set_val, string delimiter )
    {
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( element_set set_val )
{
    return to_string( set_val, "|" );
}

phylum_set to_phylum_set( string set_val, string delimiter )
{
    phylum_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_phylum( str ) ] = true;
    }
    return retval;
}

phylum_set to_phylum_set( string set_val )
{
    return to_phylum_set( set_val, "|" );
}

string to_string( phylum_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( phylum_set set_val )
{
    return to_string( set_val, "|" );
}

coinmaster_set to_coinmaster_set( string set_val, string delimiter )
{
    coinmaster_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_coinmaster( str ) ] = true;
    }
    return retval;
}

coinmaster_set to_coinmaster_set( string set_val )
{
    return to_coinmaster_set( set_val, "|" );
}

string to_string( coinmaster_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( coinmaster_set set_val )
{
    return to_string( set_val, "|" );
}

thrall_set to_thrall_set( string set_val, string delimiter )
{
    thrall_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_thrall( str ) ] = true;
    }
    return retval;
}

thrall_set to_thrall_set( string set_val )
{
    return to_thrall_set( set_val, "|" );
}

string to_string( thrall_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( thrall_set set_val )
{
    return to_string( set_val, "|" );
}

bounty_set to_bounty_set( string set_val, string delimiter )
{
    bounty_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_bounty( str ) ] = true;
    }
    return retval;
}

bounty_set to_bounty_set( string set_val )
{
    return to_bounty_set( set_val, "|" );
}

string to_string( bounty_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( bounty_set set_val )
{
    return to_string( set_val, "|" );
}

servant_set to_servant_set( string set_val, string delimiter )
{
    servant_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_servant( str ) ] = true;
    }
    return retval;
}

servant_set to_servant_set( string set_val )
{
    return to_servant_set( set_val, "|" );
}

string to_string( servant_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( servant_set set_val )
{
    return to_string( set_val, "|" );
}

vykea_set to_vykea_set( string set_val, string delimiter )
{
    vykea_set retval;
    foreach i, str in set_val.fixed_split_string( delimiter ) {
	retval[ to_vykea( str ) ] = true;
    }
    return retval;
}

vykea_set to_vykea_set( string set_val )
{
    return to_vykea_set( set_val, "|" );
}

string to_string( vykea_set set_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach it in set_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( vykea_set set_val )
{
    return to_string( set_val, "|" );
}

// Lists:

boolean_list to_boolean_list( string list_val, string delimiter )
{
    boolean_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_boolean( str );
    }
    return retval;
}

boolean_list to_boolean_list( string list_val )
{
    return to_boolean_list( list_val, "|" );
}

// A list of booleans looks same as a set of ints
// string to_string( boolean_list list, string delimiter );
// string to_string( boolean_list list );

int_list to_int_list( string list_val, string delimiter )
{
    int_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_int( str );
    }
    return retval;
}

int_list to_int_list( string list_val )
{
    return to_int_list( list_val, "|" );
}

string to_string( int_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( int_list list_val )
{
    return to_string( list_val, "|" );
}

float_list to_float_list( string list_val, string delimiter )
{
    float_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_float( str );
    }
    return retval;
}

float_list to_float_list( string list_val )
{
    return to_float_list( list_val, "|" );
}

string to_string( float_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( float_list list_val )
{
    return to_string( list_val, "|" );
}

string_list to_string_list( string list_val, string delimiter )
{
    string_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = str;
    }
    return retval;
}

string_list to_string_list( string list_val )
{
    return to_string_list( list_val, "|" );
}

string to_string( string_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( it );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( string_list list_val )
{
    return to_string( list_val, "|" );
}

item_list to_item_list( string list_val, string delimiter )
{
    item_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_item( str );
    }
    return retval;
}

item_list to_item_list( string list_val )
{
    return to_item_list( list_val, "|" );
}

string to_string( item_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( item_list list_val )
{
    return to_string( list_val, "|" );
}

location_list to_location_list( string list_val, string delimiter )
{
    location_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_location( str );
    }
    return retval;
}

location_list to_location_list( string list_val )
{
    return to_location_list( list_val, "|" );
}

string to_string( location_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( location_list list_val )
{
    return to_string( list_val, "|" );
}

class_list to_class_list( string list_val, string delimiter )
{
    class_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_class( str );
    }
    return retval;
}

class_list to_class_list( string list_val )
    {
    return to_class_list( list_val, "|" );
}

string to_string( class_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( class_list list_val )
{
    return to_string( list_val, "|" );
}

stat_list to_stat_list( string list_val, string delimiter )
{
    stat_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_stat( str );
    }
    return retval;
}

stat_list to_stat_list( string list_val )
{
    return to_stat_list( list_val, "|" );
}

string to_string( stat_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( stat_list list_val )
{
    return to_string( list_val, "|" );
}

skill_list to_skill_list( string list_val, string delimiter )
{
    skill_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_skill( str );
    }
    return retval;
}
    
skill_list to_skill_list( string list_val )
{
    return to_skill_list( list_val, "|" );
}

string to_string( skill_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( skill_list list_val )
{
    return to_string( list_val, "|" );
}

effect_list to_effect_list( string list_val, string delimiter )
{
    effect_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_effect( str );
    }
    return retval;
}

effect_list to_effect_list( string list_val )
{
    return to_effect_list( list_val, "|" );
}

string to_string( effect_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( effect_list list_val )
{
    return to_string( list_val, "|" );
}

familiar_list to_familiar_list( string list_val, string delimiter )
{
    familiar_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_familiar( str );
    }
    return retval;
}

familiar_list to_familiar_list( string list_val )
{
    return to_familiar_list( list_val, "|" );
}

string to_string( familiar_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( familiar_list list_val )
{
    return to_string( list_val, "|" );
}

slot_list to_slot_list( string list_val, string delimiter )
{
    slot_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_slot( str );
    }
    return retval;
}

slot_list to_slot_list( string list_val )
{
    return to_slot_list( list_val, "|" );
}

string to_string( slot_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( slot_list list_val )
{
    return to_string( list_val, "|" );
}

monster_list to_monster_list( string list_val, string delimiter )
{
    monster_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_monster( str );
    }
    return retval;
}

monster_list to_monster_list( string list_val )
{
    return to_monster_list( list_val, "|" );
}

string to_string( monster_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( monster_list list_val )
{
    return to_string( list_val, "|" );
}

element_list to_element_list( string list_val, string delimiter )
{
    element_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_element( str );
    }
    return retval;
}

element_list to_element_list( string list_val )
{
    return to_element_list( list_val, "|" );
}

string to_string( element_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( element_list list_val )
{
    return to_string( list_val, "|" );
}

phylum_list to_phylum_list( string list_val, string delimiter )
{
    phylum_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_phylum( str );
    }
    return retval;
}

phylum_list to_phylum_list( string list_val )
{
    return to_phylum_list( list_val, "|" );
}

string to_string( phylum_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( phylum_list list_val )
{
    return to_string( list_val, "|" );
}

coinmaster_list to_coinmaster_list( string list_val, string delimiter )
{
    coinmaster_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_coinmaster( str );
    }
    return retval;
}

coinmaster_list to_coinmaster_list( string list_val )
{
    return to_coinmaster_list( list_val, "|" );
}

string to_string( coinmaster_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( coinmaster_list list_val )
{
    return to_string( list_val, "|" );
}

thrall_list to_thrall_list( string list_val, string delimiter )
{
    thrall_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_thrall( str );
    }
    return retval;
}

thrall_list to_thrall_list( string list_val )
{
    return to_thrall_list( list_val, "|" );
}

string to_string( thrall_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( thrall_list list_val )
{
    return to_string( list_val, "|" );
}

bounty_list to_bounty_list( string list_val, string delimiter )
{
    bounty_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_bounty( str );
    }
    return retval;
}

bounty_list to_bounty_list( string list_val )
{
    return to_bounty_list( list_val, "|" );
}

string to_string( bounty_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( bounty_list list_val )
{
    return to_string( list_val, "|" );
}

servant_list to_servant_list( string list_val, string delimiter )
{
    servant_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_servant( str );
    }
    return retval;
}

servant_list to_servant_list( string list_val )
{
    return to_servant_list( list_val, "|" );
}

string to_string( servant_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( servant_list list_val )
{
    return to_string( list_val, "|" );
}

vykea_list to_vykea_list( string list_val, string delimiter )
{
    vykea_list retval;
    foreach i, str in list_val.fixed_split_string( delimiter ) {
	retval[ i ] = to_vykea( str );
    }
    return retval;
}

vykea_list to_vykea_list( string list_val )
{
    return to_vykea_list( list_val, "|" );
}

string to_string( vykea_list list_val, string delimiter )
{
    buffer buf;
    string delim = "";
    foreach i, it in list_val {
	buf.append( delim );
	buf.append( to_string( it ) );
	delim = delimiter;
    }
    return buf.to_string();
}

string to_string( vykea_list list_val )
{
    return to_string( list_val, "|" );
}

// Values work best if they are "normalized".
//
// "seal tooth" is a normalized "item"
// "seal to" is not normalized.
// "snorkel|seal tooth" is a normalized "list" or "set" of "item"
// "snork|seal to" is not normalized
//
// This package provides functions to normalize string values. Since
// users can set properties to whatever they wish, it uses these
// functions itself, but user programs can also use them if they want to
// ensure that properties that they set are precise.

string normalize_value( string value, string type )
{
    switch ( type ) {
    case "string":
	return value;
    case "boolean":
	return to_string( to_boolean( value ) );
    case "int":
	return to_string( to_int( value ) );
    case "float":
	return to_string( to_float( value ) );
    case "item":
	return to_string( to_item( value ) );
    case "location":
	return to_string( to_location( value ) );
    case "class":
	return to_string( to_class( value ) );
    case "stat":
	return to_string( to_stat( value ) );
    case "skill":
	return to_string( to_skill( value ) );
    case "effect":
	return to_string( to_effect( value ) );
    case "familiar":
	return to_string( to_familiar( value ) );
    case "slot":
	return to_string( to_slot( value ) );
    case "monster":
	return to_string( to_monster( value ) );
    case "element":
	return to_string( to_element( value ) );
    case "phylum":
	return to_string( to_phylum( value ) );
    case "coinmaster":
	return to_string( to_coinmaster( value ) );
    case "thrall":
	return to_string( to_thrall( value ) );
    case "bounty":
	return to_string( to_bounty( value ) );
    case "servant":
	return to_string( to_servant( value ) );
    case "vykea":
	return to_string( to_vykea( value ) );
    }
    return value;
}

string normalize_list( string value, string type, string delimiter )
{
    string_list list_val;
    foreach i, it in value.fixed_split_string( delimiter ) { 
	list_val[ i ] = normalize_value( it, type );
    }
    return to_string( list_val, delimiter );
}

string normalize_list( string value, string type )
{
    return normalize_list( value, type, "|" );
}

string normalize_set( string value, string type, string delimiter )
{
    // Sets are unordered, but the input string may be manually ordered.
    // Preserve the ordering if all the values are already normalized.

    string_set set_val;
    boolean changed = false;

    foreach i, it in value.fixed_split_string( delimiter ) { 
	string val = normalize_value( it, type );
	changed |= ( val != it );
	set_val[ val ] = true;
    }

    return changed ? to_string( set_val, delimiter ) : value;
}

string normalize_set( string value, string type )
{
    return normalize_set( value, type, "|" );
}

string normalize_value( string value, string type, string collection, string delimiter )
{
    switch ( collection ) {
    case "list":
	return normalize_list( value, type, delimiter );
    case "set":
	return normalize_set( value, type, delimiter );
    }
    return normalize_value( value, type );
}

string normalize_value( string value, string type, string collection )
{
    return normalize_value( value, type, collection, "|" );
}

// define_property specifies that a particular property with NAME is of type TYPE.
// Optionally, you can declare that the value is a COLLECTION (either "list" or "set") with a DELIMITER
// NAME can be either built-in to KoLmafia or a custom user property.
// If it is a custom property, you can specify a DEFAULT value
//
// If the property exists, define_property will fetch the value,
// normalize it, and return it.
//    If the property is custom and the normalized value equals
//    the normalized default value, the property will be removed.
//    If the property is custom and the value is not normalized,
//    the property will be set with the normalized value.
//
// If the property does not exist, define_property will return the
// (normalized) default value and the property will remain unset.

string define_property( string name, string type, string def, string collection, string delimiter )
{
    // All "built-in" properties exist. A "custom" property that doesn't
    // exist uses the (normalized) default.
    if ( !property_exists( name ) ) {
	string normalized_default = normalize_value( def, type, collection, delimiter );
	return normalized_default;
    }

    // The property exists and (potentially) overrides the default
    string raw_value = get_property( name );
    string value = normalize_value( raw_value, type, collection, delimiter );

    // A "custom" property has no default. Normalize it, if needed
    if ( !property_has_default( name ) ) {
	string normalized_default = normalize_value( def, type, collection, delimiter );
	if ( value == normalized_default ) {
	    remove_property( name );
	} else if ( raw_value != value ) {
	    set_property( name, value );
	}
    }

    // Return the normalized property value
    return value;
}

string define_property( string name, string type, string def, string collection )
{
    return define_property( name, type, def, collection, "|" );
}

string define_property( string name, string type, string def )
{
    return define_property( name, type, def, "", "" );
}

// You can use these in conjunction with the appropriate coercion
// function to extract the value of a property into the appropriate data
// type. For example:
//
// int prop1 = define_property( "prop1", "int", "12" ).to_int();
// boolean prop2 = define_property( "prop2", "boolean", "true" ).to_boolean();
// item prop3 = define_property( "prop3", "item", "snorkel" ).to_item();
// item_set prop4 = define_property( "prop4", "item", "snorkel|seal tooth", "set" ).to_set_of_item();
// string_list prop5 =  define_property( "prop5", "string", "str1,str2,str3", "list", "," ).to_list_of_string( "," );
