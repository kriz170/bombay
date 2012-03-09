update item_template set FlagsExtra=0 where buyprice != 0 and itemlevel IN (232,245,258,272) and FlagsExtra IN (1,2);
update item_template set allowablerace=-1 where allowablerace IN (690,1101) and itemlevel IN (232,245,258,272);
