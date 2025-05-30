PGDMP  $    &                }            gestionrutas    17.4    17.4 ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24630    gestionrutas    DATABASE     r   CREATE DATABASE gestionrutas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'es-CO';
    DROP DATABASE gestionrutas;
                     postgres    false            �            1259    24631    estados    TABLE     d   CREATE TABLE public.estados (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.estados;
       public         heap r       postgres    false            �            1259    24634    estados_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.estados_id_seq;
       public               postgres    false    217            �           0    0    estados_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.estados_id_seq OWNED BY public.estados.id;
          public               postgres    false    218            �            1259    24635    horarios    TABLE     �   CREATE TABLE public.horarios (
    id integer NOT NULL,
    ruta_id integer,
    frecuencia_minutos integer NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL
);
    DROP TABLE public.horarios;
       public         heap r       postgres    false            �            1259    24638    horarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.horarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.horarios_id_seq;
       public               postgres    false    219            �           0    0    horarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.horarios_id_seq OWNED BY public.horarios.id;
          public               postgres    false    220            �            1259    24639    rutas    TABLE     �   CREATE TABLE public.rutas (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text NOT NULL,
    imagen_url text NOT NULL,
    origen_id integer,
    destino_id integer,
    estado_id integer
);
    DROP TABLE public.rutas;
       public         heap r       postgres    false            �            1259    24644    rutas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rutas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.rutas_id_seq;
       public               postgres    false    221            �           0    0    rutas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.rutas_id_seq OWNED BY public.rutas.id;
          public               postgres    false    222            �            1259    24645    ubicaciones    TABLE     i   CREATE TABLE public.ubicaciones (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);
    DROP TABLE public.ubicaciones;
       public         heap r       postgres    false            �            1259    24648    ubicaciones_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ubicaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.ubicaciones_id_seq;
       public               postgres    false    223            �           0    0    ubicaciones_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.ubicaciones_id_seq OWNED BY public.ubicaciones.id;
          public               postgres    false    224            �            1259    24682    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(255),
    email character varying(255) NOT NULL,
    imagen_url text,
    proveedor character varying(100)
);
    DROP TABLE public.usuarios;
       public         heap r       postgres    false            �            1259    24681    usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.usuarios_id_seq;
       public               postgres    false    226            �           0    0    usuarios_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;
          public               postgres    false    225            5           2604    24649 
   estados id    DEFAULT     h   ALTER TABLE ONLY public.estados ALTER COLUMN id SET DEFAULT nextval('public.estados_id_seq'::regclass);
 9   ALTER TABLE public.estados ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217            6           2604    24650    horarios id    DEFAULT     j   ALTER TABLE ONLY public.horarios ALTER COLUMN id SET DEFAULT nextval('public.horarios_id_seq'::regclass);
 :   ALTER TABLE public.horarios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219            7           2604    24651    rutas id    DEFAULT     d   ALTER TABLE ONLY public.rutas ALTER COLUMN id SET DEFAULT nextval('public.rutas_id_seq'::regclass);
 7   ALTER TABLE public.rutas ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221            8           2604    24652    ubicaciones id    DEFAULT     p   ALTER TABLE ONLY public.ubicaciones ALTER COLUMN id SET DEFAULT nextval('public.ubicaciones_id_seq'::regclass);
 =   ALTER TABLE public.ubicaciones ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223            9           2604    24685    usuarios id    DEFAULT     j   ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);
 :   ALTER TABLE public.usuarios ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            �          0    24631    estados 
   TABLE DATA           -   COPY public.estados (id, nombre) FROM stdin;
    public               postgres    false    217   �0       �          0    24635    horarios 
   TABLE DATA           Z   COPY public.horarios (id, ruta_id, frecuencia_minutos, hora_inicio, hora_fin) FROM stdin;
    public               postgres    false    219   1       �          0    24639    rutas 
   TABLE DATA           f   COPY public.rutas (id, nombre, descripcion, imagen_url, origen_id, destino_id, estado_id) FROM stdin;
    public               postgres    false    221   o1       �          0    24645    ubicaciones 
   TABLE DATA           1   COPY public.ubicaciones (id, nombre) FROM stdin;
    public               postgres    false    223   �<       �          0    24682    usuarios 
   TABLE DATA           L   COPY public.usuarios (id, nombre, email, imagen_url, proveedor) FROM stdin;
    public               postgres    false    226   g=       �           0    0    estados_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.estados_id_seq', 3, true);
          public               postgres    false    218            �           0    0    horarios_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.horarios_id_seq', 10, true);
          public               postgres    false    220            �           0    0    rutas_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.rutas_id_seq', 10, true);
          public               postgres    false    222            �           0    0    ubicaciones_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ubicaciones_id_seq', 17, true);
          public               postgres    false    224            �           0    0    usuarios_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.usuarios_id_seq', 2, true);
          public               postgres    false    225            ;           2606    24654    estados estados_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.estados DROP CONSTRAINT estados_pkey;
       public                 postgres    false    217            =           2606    24656    horarios horarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.horarios DROP CONSTRAINT horarios_pkey;
       public                 postgres    false    219            ?           2606    24658    rutas rutas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.rutas DROP CONSTRAINT rutas_pkey;
       public                 postgres    false    221            A           2606    24660    ubicaciones ubicaciones_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ubicaciones
    ADD CONSTRAINT ubicaciones_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.ubicaciones DROP CONSTRAINT ubicaciones_pkey;
       public                 postgres    false    223            C           2606    24691    usuarios usuarios_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_email_key;
       public                 postgres    false    226            E           2606    24689    usuarios usuarios_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public                 postgres    false    226            F           2606    24661    horarios horarios_ruta_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_ruta_id_fkey FOREIGN KEY (ruta_id) REFERENCES public.rutas(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.horarios DROP CONSTRAINT horarios_ruta_id_fkey;
       public               postgres    false    221    219    4671            G           2606    24666    rutas rutas_destino_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_destino_id_fkey FOREIGN KEY (destino_id) REFERENCES public.ubicaciones(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.rutas DROP CONSTRAINT rutas_destino_id_fkey;
       public               postgres    false    221    223    4673            H           2606    24671    rutas rutas_estado_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_estado_id_fkey FOREIGN KEY (estado_id) REFERENCES public.estados(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.rutas DROP CONSTRAINT rutas_estado_id_fkey;
       public               postgres    false    4667    217    221            I           2606    24676    rutas rutas_origen_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_origen_id_fkey FOREIGN KEY (origen_id) REFERENCES public.ubicaciones(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.rutas DROP CONSTRAINT rutas_origen_id_fkey;
       public               postgres    false    4673    223    221            �   /   x�3�tL.�,K�2���K�0�9]�r�JR�2s3S�J�b���� /	J      �   ]   x�m���0C�f�
�����(��*�����@*�V���Rh��@�����**t��v�����aX#���Č)�@��s_D� �*�      �   .  x��Z�r#��ɧ���"y�����*_��D��d�;���b��&#��R9phU]�̡�&zw����˓d�H ;�==�_ݽ��o��.gG�Ж7��1�悶�a�NQ��g���S��k�%?�=������b�TB��;�����=��J��5�$-%_�e�HM�G
>P�l�jX�,Y�J�A*�(E�����8]˭}����L�M���G[)��"6��iB1gdC�_wTq��7lI?�J4��S0'�Q��|I��Z�}$'�����8<g=�
��S/�V�9Y����Ǿ6���xx����J6����>�-�~�5��"c�5UHqp����R����O/CeP[����^�.�^_1�$��[������3+�~��y«锭��V_��?U"2�=�*��n��ۥ��B��8��u���/���A�=/VrwQ�ݜ�艢{�oZI��!7lut{4;��u��'�;ؾ��Q�Oi����$bV-����u����D����Kf��=���m�Jh��%�+Ut%�AE�[n�	c�s	�U������d�'�u%f���p�Ml���.o���]���[	���7��q�*����+l�1�鷩�Ub;��yn9 9q^{Z��8��'��c��n8���5S5ų>�k��Z����ga63�|6�:�Fz�^���#@Y��	nFG����̬Gk����e����=�<�@�l'��~��*\��ą�D�� ��'a�ĳ_s&����r�k�q�VGJ2k ��%�dv,|�|(ݟ�� � �GRq.��Q��?Fn�ǋu��iøH �� &���<T�T\�T\hT\LBŕ�$�����Ȁ���)DY�?��	�@Cv�eV(WxV�ǞK�IпTwF֬�u��a[XD���i�6	��+���y��("(d�'��K�5ڲU��M�B�'��Z��|�����"@1�ʴ�j���E� ς*�m��mo�UhZ�7�r hMk8�J�$�4Y��V.V�t��?~�s��+[ohή�j=�~W a`�hj�h�¥�_�.� �7�;��IdS�0�~�3<F�׌�T��ťZ0��_�"�?dl{8W��C�������:\��p�`q���y0�@�@�G�
��E��UfÂ'���"%�.��Bg&4U�
)z5^����o;i�p4�|x��t��2���tA�4\�r�%s��oF��L��v��ev�T��J���I)e ��rj�؁pǥ�]��}� �.$̩���.�li��ge�Vp�BDP��&��������^�]T�>2'F_u��Ѷ��as�_�����cG�����-kd-�n:�c\/��Y�3"�!aϚ�P"��mĳ�*Q`]�P�l ��Źu�BM�S�k"8�M~�A��9MAڹ(�i��ڰDL���B�G�CxV	s��с����Ci��&���X�^��;᎐�󓡲+�sa��k��GU��YY׌�nYK����3�gB�U
�G7��/5�^OC���ŋ��lDE�JXo��KT;���`Gc�K�=0�����nOSOx��֭�c� 5��rౖ���!|B�`KǍ�l� }��h�$�'�0$�(K� @|B-��0��*�sR"�C��7<�̫�<��g_�-�"��:�>6ys� ��@��q��p���<J��,9�_�f��"�끎��n�����} kl%�T�6rE�N���q�z��i�a7)�8A���q��R���ٚ��Xw�b��h�-�kD���$����{�v��R0{vI�Vw��M=��Q�p�g�na4=�x>�V��A�^�L�w���L���z�Tە����Ca�I���h�k�G~Ї�����.�JL�$�f��f#Pឭ��L!���{�^b�%��1w�yS����9� �H�`*p2�(,#�G�8p8�O�p[,�|>�0� �aS%\8�.LH�BCҴّG�2�49G-כ���g�m%;�a����F�1������^D�����v�D������S"�֌�Yd��f�w�v2^���2;Re���MP�Sz����7��X��|�Gt�b�ideX�쌥`���q_k�X\��N�
�]�WGs��&��9
:�?�~��26�q�4f�k��dpRl�ƞ=��~ ���n�z�*j��W*�
vD��[=���M%��X��kN�妋��Z=�����F����9�o�q^�RoY۪��%��������aO">@�|����q���{H9�dT�@����y�u�G�/ ���2�UV�ݛ,��5�g�;�i��x�&��:K'�B��?�S�U�%���@�O�T�Q�������i:~3�p]��荝��q	fE���ZKl�⬟��8�GMJ=�6���]��a�S�D���Tn�Q���=i��CA��@wv�&�^M�0q�/yma,蝰\���}D5�~]\��;����M�8���0�ML\��x7��o�t�2e!�(H)q�=�K�ǯW�Ϯ\�*�����ϩ�uU�w�Fo�D��j�H+����$z1q諛�����`ip24
T��i���M��x�:9���D?�4I
����IP8E<��X�-���Km,
���ׯ+5�
|�t0H��1��"������+���I�r��5w��M�g�	��ѕ:�����ލ^�3g�<!��3��@E�{�`���K�&:�?	���2	k*Q�򘶀5��0:�=��&�˃X�Z��~���uFr�;��Ae��J(���K��3|��ż�<�Գ�^�)e�i�o>K�z�Z]��H6      �   �   x��Mn1�5��'����.ݼ#ilb��ۗtz�O/�*}�����'��|�
G5���6���)���FM|E1�Ӫ��$yN���q{L�a���-�H8�P���H�i�%~�p�'Z�q:�b��r��u}�TdK�`�
����'t8��If��ρ�� PG=      �   �   x���Mo�0 @��W��Pq�%KFH�v��1.��RRZ없_�O����wxSp�J`Q��@��#8=-�X�[كƘA��!o���qj5UD
C��!��%��;�Hh󸌙���q?=|v��9�rۡzw��ڏH��ݫN�|����z3PaNU�'�䴖�=tϢ�_C��1���/��F��8Z��T�A�)re��8S�qֹ�,��}�	<��w�dt     