*&---------------------------------------------------------------------*
*& Report zattf_p_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zattf_p_001.
*
*CLASS lcl_laboratory DEFINITION.
*PUBLIC SECTION.
*METHODS:main,
*        get_number_of_heads RETURNING value(r_result) TYPE i,
*        set_number_of_heads IMPORTING id_number_of_heads TYPE i.
*PROTECTED SECTION.
*  data : number_of_heads type i .
*PRIVATE SECTION.
*
*  METHODS create_monster
*    IMPORTING
*      id_number_of_heads TYPE i
*    RETURNING
*      value(r_result) TYPE i.
*ENDCLASS. "LaboratoryDefinition
*CLASS lcl_laboratory IMPLEMENTATION.
*METHOD main.
** LocalVariables
*DATA:monster_number TYPE i,
*number_of_heads TYPE i.
*monster_number = create_monster( id_number_of_heads = number_of_heads ).
*ENDMETHOD.
*
*  METHOD create_monster.
*
*  ENDMETHOD.
*
*  METHOD get_number_of_heads.
*    r_result = me->number_of_heads.
*  ENDMETHOD.
*
*  METHOD set_number_of_heads.
*    me->number_of_heads = id_number_of_heads.
*  ENDMETHOD.
*
*ENDCLASS. "LaboratoryImplementation
*class lcl_monster DEFINITION.
*  PRIVATE SECTION.
*
*    METHODS main.
*    METHODS derive_monster_sanity
*      IMPORTING
*        i_monster_madness1 TYPE i
*       EXPORTING
*       description type string.
*endclass.
*CLASS lcl_monster IMPLEMENTATION.
*METHOD main.
** LocalVariables
*DATA: monster_madness1 TYPE i,
*monster_madness2 TYPE i,
*monster_madness3 TYPE i,
*description2 TYPE string,
*description3 TYPE string.
*monster_madness1 = 25.
*monster_madness2 = 50.
*monster_madness3 = 100.
*derive_monster_sanity( monster_madness1 ).
*IF monster_madness2 LT 30.
*description2 = 'FAIRLYSANE'.
*ELSEIF monster_madness2 GT 90.
*description2 = 'BONKERS'.
*ELSE.
*description2 = 'AVERAGESANITY'.
*ENDIF.
*IF monster_madness3 LT 30.
*description3 = 'FAIRLYSANE'.
*ELSEIF monster_madness3 GT 90.
*description3 = 'BONKERS'.
*ELSE.
*description3 = 'AVERAGESANITY'.
*ENDIF.
*ENDMETHOD.
*
*  METHOD derive_monster_sanity.
*
*
** DeriveMonsterSanity
*IF i_monster_madness1 LT 30.
*description = 'FAIRLYSANE'.
*ELSEIF i_monster_madness1 GT 90.
*description = 'BONKERS'.
*ELSE.
*description = 'AVERAGESANITY'.
*ENDIF.
*
*  ENDMETHOD.
*
*ENDCLASS.
CLASS lcl_how_many_monsters DEFINITION.
PUBLIC SECTION.
METHODS how_many_make_five RETURNING VALUE(rd_how_many) TYPE i.
ENDCLASS. "HowManyMonstersDefinition
CLASS lcl_how_many_monsters IMPLEMENTATION.
METHOD how_many_make_five.
DO 100 TIMES.
ADD 1 TO rd_how_many.
IF rd_how_many = 5.
RETURN.
ENDIF.
ENDDO.
ENDMETHOD.
ENDCLASS. "HowManyMonstersimplementation
DATA: how_many TYPE i,
counter TYPE REF TO lcl_how_many_monsters.
START-OF-SELECTION.
CREATE OBJECT counter.
how_many = counter->how_many_make_five( ).
WRITE:/ how_many.
