--  {{Ada/Sourceforge|to_lower_2.adb}}

pragma License (Gpl);
pragma Ada_95;

with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Characters.Handling;

procedure To_Lower_2 is

   package CL renames Ada.Command_Line;
   package T_IO renames Ada.Text_IO;

   function Equal_Ignore_Case
     (S    : String;
      T    : String)
      return Boolean;

   Value_1 : constant String := CL.Argument (1);
   Value_2 : constant String := CL.Argument (2);

   function To_Lower (C : Character) return Character renames
      Ada.Characters.Handling.To_Lower;

   --  equal-ignore-case -- returns true if s or t are equal,
   --  ignoring case
   function Equal_Ignore_Case
     (S    : String;
      T    : String)
      return Boolean
   is
      O : constant Integer := S'First - T'First;
   begin
      if T'Length /= S'Length then
         return False;  --  if they aren't the same length, they
                        --  aren't equal
      else
         for I in  S'Range loop
            if To_Lower (S (I)) /=
               To_Lower (T (I + O))
            then
               return False;
            end if;
         end loop;
      end if;
      return True;
   end Equal_Ignore_Case;

begin
   T_IO.Put (Value_1);
   T_IO.Put (" and ");
   T_IO.Put (Value_2);
   T_IO.Put (" are ");
   if not Equal_Ignore_Case (Value_1, Value_2) then
      T_IO.Put ("not ");
   end if;
   T_IO.Put ("same.");

   return;
end To_Lower_2;

----------------------------------------------------------------------------
--  $Author: krischik $
--
--  $Revision: 226 $
--  $Date: 2007-12-02 15:11:44 +0000 (Sun, 02 Dec 2007) $
--
--  $Id: to_lower_2.adb 226 2007-12-02 15:11:44Z krischik $
--  $HeadURL: file:///svn/p/wikibook-ada/code/trunk/demos/Source/to_lower_2.adb $
----------------------------------------------------------------------------
--  vim:  textwidth=0 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab
--  vim:  filetype=ada encoding=utf-8 fileformat=unix foldmethod=indent
