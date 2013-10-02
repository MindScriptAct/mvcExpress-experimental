/*
 * Copyright (c) 2011 the original author or authors
 *
 * Permission is hereby granted to use, modify, and distribute this file
 * in accordance with the terms of the license agreement accompanying it.
 */

package avmplus {

/**
 * Makes the hidden, inofficial function describeTypeJSON available outside of the avmplus
 * package.
 *
 * <strong>As Adobe doen't officially support this method and it is only visible to client
 * code by accident, it should only ever be used with runtime-detection and automatic fallback
 * on describeType.</strong>
 *
 * @see http://www.tillschneidereit.de/2009/11/22/improved-reflection-support-in-flash-player-10-1/
 */
public class DescribeTypeJSON {
	//----------------------              Public Properties             ----------------------//
	public static var available:Boolean = describeTypeJSON != null;

	public static const INSTANCE_FLAGS:uint = INCLUDE_BASES | INCLUDE_INTERFACES | INCLUDE_VARIABLES | INCLUDE_ACCESSORS | INCLUDE_METHODS | INCLUDE_METADATA | INCLUDE_CONSTRUCTOR | INCLUDE_TRAITS | USE_ITRAITS | HIDE_OBJECT;
	public static const CLASS_FLAGS:uint = INCLUDE_INTERFACES | INCLUDE_VARIABLES | INCLUDE_ACCESSORS | INCLUDE_METHODS | INCLUDE_METADATA | INCLUDE_TRAITS | HIDE_OBJECT;

	public static const MY_CLASS_FLAGS:uint = //

			INCLUDE_BASES |
			INCLUDE_CONSTRUCTOR |
			INCLUDE_INTERFACES |
			INCLUDE_METHODS |

			INCLUDE_VARIABLES | //
					INCLUDE_ACCESSORS | //
					INCLUDE_METADATA | //
					USE_ITRAITS | INCLUDE_TRAITS |  //
					HIDE_OBJECT | HIDE_NSURI_METHODS; //

	//----------------------               Public static Methods               ----------------------//

	static public function getClassDescription(type:Class):Object {
		return describeTypeJSON(type, MY_CLASS_FLAGS);
	}

	static public function describeType(target:Object, flags:uint):Object {
		return describeTypeJSON(target, flags);
	}

	static public function getInstanceDescription(type:Class):Object {
		return describeTypeJSON(type, INSTANCE_FLAGS);
	}

	static public function getClassDescription2(type:Class):Object {
		return describeTypeJSON(type, CLASS_FLAGS);
	}

	static public function getClassTest1(type:Class):Object {
		return describeTypeJSON(type, //
				INCLUDE_VARIABLES | //
						INCLUDE_BASES | //
						INCLUDE_ACCESSORS | //
						USE_ITRAITS | INCLUDE_TRAITS |  //
						HIDE_OBJECT | HIDE_NSURI_METHODS //
		);
	}

	static public function getClassTest2(type:Class):Object {
		return describeTypeJSON(type, //
				INCLUDE_VARIABLES | //
						INCLUDE_ACCESSORS | //
						USE_ITRAITS | INCLUDE_TRAITS |  //
						HIDE_OBJECT | HIDE_NSURI_METHODS //
		);
	}


	static public function getClassTest3(type:Class):Object {
		return describeTypeJSON(type, //
				INCLUDE_VARIABLES | //
						INCLUDE_ACCESSORS | //
						INCLUDE_METADATA | //
						USE_ITRAITS | INCLUDE_TRAITS |  //
						HIDE_OBJECT | HIDE_NSURI_METHODS //
		);
	}


	//public const INCLUDE_BASES : uint;
	//public const INCLUDE_CONSTRUCTOR : uint;
	//public const INCLUDE_INTERFACES : uint;
	//public const INCLUDE_METHODS : uint;


	//public const INCLUDE_METADATA : uint;

	//public const HIDE_NSURI_METHODS : uint;
	//public const HIDE_OBJECT : uint;


	//public const INCLUDE_VARIABLES : uint;
	//public const INCLUDE_ACCESSORS : uint;


	//public const INCLUDE_TRAITS : uint;
	//public const USE_ITRAITS : uint;
}
}