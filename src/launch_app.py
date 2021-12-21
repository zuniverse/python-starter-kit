if __name__ == '__main__':
    import logging
    import argparse

    logger = logging.getLogger(__name__)

    parser = argparse.ArgumentParser(description='Launch actions.')
    parser.add_argument(
        '--argkey1',
        help='Choose what action to be launched'
    )
    parser.add_argument(
        '--argkey2',
        default='argval2',
        help='Description of what the argument does (\
            default: "argval2")'
    )
    parser.add_argument(
        '--argkey3',
        default='argval3',
        help='Description of what the argument does (\
            default: "argval3")'
    )
    args = parser.parse_args()

    logger.debug(f'launch_app with args: argkey1={args.argval1} argkey2=\
        {args.argval2} argkey3={args.argval3}')

    if args.argval1 == 'argval1':
        from src.package1 import main
        flag_1 = True if args.argval2 == 'argval2' else False
        flag_2 = 'argval3'
        main(flag_1, flag_2)
